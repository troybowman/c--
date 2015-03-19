#!/usr/bin/env python

import sys
import os
import re
import glob
import subprocess
import mmap
from argparse import *

#------------------------------------------------------------------------------
SYMS = "syms"
TREE = "tree"
IR   = "ir"
ASM  = "asm"
REAL = "real"
OPT  = "opt"

phase_names = [ SYMS, TREE, IR, ASM, REAL, OPT ]

#------------------------------------------------------------------------------
class Tester(ArgumentParser):

    INFO = 0
    VERB = 1
    TRCE = 2

    FAILURE  = '\033[91m'
    SUCCESS  = '\033[92m'
    WARNING  = '\033[93m'
    ENDCOLOR = '\033[0m'

    def __init__(self):
        self.__find_cmm__() # fail if we're not in the c-- directory tree
        ArgumentParser.__init__(self, formatter_class=ArgumentDefaultsHelpFormatter)
        self.add_argument(
            "-p", "--phase_spec",
            help="list of phases to run",
            metavar="PHASES",
            nargs="+",
            choices=phase_names,
            default=phase_names)
        self.add_argument(
            "-f", "--file_pattern",
            help="only compile files matching the given pattern",
            metavar="FILES",
            default="*.c")
        self.add_argument(
            "-v", "--verbosity",
            help="set verbosity level: 0=sparse, 1=verbose, 2=trace",
            metavar="LEVEL",
            type=int,
            default=self.VERB)
        self.add_argument(
            "-g", "--grind",
            help="enable valgrind memory checks",
            action="store_true",
            default=False)

    def __find_cmm__(self):
        cur = os.getcwd()
        while not os.path.basename(cur).lower() == "c--":
            parent = os.path.dirname(cur)
            if parent == cur:
                raise Exception("Error: could not find c-- root directory!")
            cur = parent
        self.home = cur
        self.dbg = os.path.join(self.home, "bin", "debug", "c--")
        if not os.path.exists(self.dbg):
            self.dbg = None
        self.opt = os.path.join(self.home, "bin", "release", "c--")
        if not os.path.exists(self.opt):
            self.opt = None

    def parse_args(self):
        self.args = super(Tester, self).parse_args()

    def debug(self):
        if self.dbg is None:
            raise Exception("Error: could not find c-- debug binary!")
        return self.dbg

    def release(self):
        if self.opt is None:
            raise Exception("Error: could not find c-- release binary!")
        return self.opt

    def out(self, verbosity, text, color=""):
        if self.args.verbosity >= verbosity:
            endcolor = "" if color is "" else self.ENDCOLOR
            sys.stdout.write(color + text + endcolor)

    def info(self, text, color=""):
        self.out(self.INFO, text, color)
    def verb(self, text, color=""):
        self.out(self.VERB, text, color)
    def trce(self, text, color=""):
        self.out(self.TRCE, text, color)

    def success(self, text):
        self.info(text, self.SUCCESS)
    def failure(self, text):
        self.info(text, self.FAILURE)
    def warning(self, text):
        self.info(text, self.WARNING)

#------------------------------------------------------------------------------
def replace_ext(path, ext):
    base = os.path.splitext(path)[0]
    return base + "." + ext

#------------------------------------------------------------------------------
def simplify_inpath(path):
    f = os.path.basename(path)
    b = os.path.dirname(path)
    d = os.path.basename(b)
    return os.path.join(d, f)

#------------------------------------------------------------------------------
class StderrMonitor:

    def __init__(self, inpath):
        self.errpath = replace_ext(inpath, "stderr")

    def __enter__(self):
        self.errfile = open(self.errpath, "w")
        return self.errfile

    def __exit__(self, tp, v, tr):
        self.errfile.close()
        if os.path.getsize(self.errpath) == 0:
            os.remove(self.errpath)

#------------------------------------------------------------------------------
class MemoryMonitor:

    def __init__(self, enabled, phase_argv, inpath):
        self.enabled  = enabled
        self.def_argv = phase_argv + [ inpath ]
        self.log      = replace_ext(inpath, "vgd")

    def __enter__(self):
        if not self.enabled:
            return self.def_argv
        else:
            return [ "valgrind",
                     "--leak-check=full",   "--show-reachable=yes",
                     "--malloc-fill=DD",    "--free-fill=BB",
                     "--track-origins=yes", "--log-file=" + self.log, "-v",
                     ] + self.def_argv

    def __exit__(self, tp, v, tr):
        if self.enabled:
            with open(self.log, "r+b") as log:
                pattern  = re.compile(r"""
                    LEAK\s+SUMMARY.*
                    definitely\s+lost:\s+0\s+bytes.*
                    indirectly\s+lost:\s+0\s+bytes.*
                    possibly\s+  lost:\s+0\s+bytes.*
                    ERROR\s+SUMMARY:\s+0\s+errors.*
                    ERROR\s+SUMMARY:\s+0\s+errors.*
                    """, re.VERBOSE | re.DOTALL)
                found = re.search(pattern, mmap.mmap(log.fileno(), 0))
            if found:
                os.remove(self.log)

#------------------------------------------------------------------------------
class TesterPhase:

    def __init__(self, dir):
        self.dir     = dir
        self.prevdir = os.getcwd()

    def __enter__(self):
        os.chdir(self.dir)
        return self

    def __exit__(self, typ, val, tb):
        os.chdir(self.prevdir)

    def compile(self, t, inpath):
        t.verb("compiling: %s\n" % simplify_inpath(inpath))
        with StderrMonitor(inpath) as errors:
            with MemoryMonitor(t.args.grind, self.argv(t), inpath) as argv:
                try:
                    subprocess.call(argv, stdout=errors, stderr=errors)
                except OSError as e:
                    errors.write("couldn't launch c--: %s\n" % e.strerror)
                except:
                    errors.write("idk wtf happened\n")
                    raise

    def execute(self, t):
        t.info("running phase: %s\n" % os.path.basename(self.dir))
        pattern = replace_ext(t.args.file_pattern, "c")
        for inpath in glob.iglob(pattern):
            self.compile(t, inpath)
        self.validate(t)

    def status(self, t):
        t.info("status:")
        status = subprocess.check_output(["git", "ls-files", "-dmo"])
        if len(status) > 0:
            t.failure("\n" + status + "\n")
        else:
            t.success(" Clean!\n\n")

    def execAsmFiles(self, t):
        pattern = replace_ext(t.args.file_pattern, "asm")
        for asm in glob.iglob(pattern):
            with open(replace_ext(asm, "out"), "w") as outfile:
                try:
                    t.verb("executing: %s\n" % asm)
                    output = subprocess.check_output(["spim", "-file", asm])
                    bullshit = re.compile("(SPIM Version)?.*Loaded:.*exceptions\.s\n", re.DOTALL)
                    output   = re.sub(bullshit, "", output)
                    outfile.write(output)
                except OSError as e:
                    outfile.write("couldn't launch spim: %s\n" % e.strerror)
                except:
                    outfile.write("idk wtf happened\n")
                    raise

    def validate(self, t):
        self.status(t)

#------------------------------------------------------------------------------
class DbgPhase(TesterPhase):

    DBG_NO_PARSE   = 0x01
    DBG_DUMP_GSYMS = 0x02
    DBG_DUMP_LSYMS = 0x04
    DBG_DUMP_TREE  = 0x08
    DBG_NO_IR      = 0x10
    DBG_DUMP_IR    = 0x20
    DBG_NO_CODE    = 0x40

    DBG_ALL_SYMS = DBG_DUMP_GSYMS | DBG_DUMP_LSYMS  # 0x06
    DBG_ALL_TREE = DBG_ALL_SYMS   | DBG_DUMP_TREE   # 0x0e
    DBG_ALL_IR   = DBG_ALL_TREE   | DBG_DUMP_IR     # 0x2e

    def __init__(self, dir, flags):
        TesterPhase.__init__(self, dir)
        self.flags = flags

    def argv(self, t):
        return [ t.debug(), "-v", hex(self.flags) ]

#------------------------------------------------------------------------------
class RealPhase(DbgPhase):

    def __init__(self, tests):
        DbgPhase.__init__(self, os.path.join(tests, REAL), DbgPhase.DBG_ALL_IR)

    def validate(self, t):
        self.execAsmFiles(t)
        self.status(t)

#------------------------------------------------------------------------------
class OptPhase(TesterPhase):

    def __init__(self, dir):
        TesterPhase.__init__(self, os.path.join(tests, OPT))

    def argv(self, t):
        return [ t.release() ]

    def execute(self, t):
        t.warning("opt: TODO\n")

    def validate(self, t):
        #self.execAsmFiles()
        #self.status()
        pass

#------------------------------------------------------------------------------
if __name__ == "__main__":

    t = Tester()

    tests = os.path.join(t.home, "tests")

    phases = {
        SYMS : DbgPhase(os.path.join(tests, SYMS),  DbgPhase.DBG_ALL_SYMS | DbgPhase.DBG_NO_IR),
        TREE : DbgPhase(os.path.join(tests, TREE),  DbgPhase.DBG_ALL_TREE | DbgPhase.DBG_NO_IR),
        IR   : DbgPhase(os.path.join(tests, IR  ),  DbgPhase.DBG_ALL_IR   | DbgPhase.DBG_NO_CODE),
        ASM  : DbgPhase(os.path.join(tests, ASM ),  DbgPhase.DBG_ALL_IR),
        REAL : RealPhase(tests),
        OPT  : OptPhase(tests),
        }

    t.parse_args()

    for step in t.args.phase_spec:
        with phases[step] as p:
            p.execute(t)
