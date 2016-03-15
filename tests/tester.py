#!/usr/bin/env python

import sys
import os
import re
import glob
import subprocess
import mmap
from argparse import *

#------------------------------------------------------------------------------
DECL = "decl"
TREE = "tree"
IR   = "ir"
ASM  = "asm"
REAL = "real"
ALL_PHASES = [DECL, TREE, IR, ASM, REAL]

#------------------------------------------------------------------------------
DBG_NO_PARSE   = 0x01
DBG_DUMP_GSYMS = 0x02
DBG_DUMP_LSYMS = 0x04
DBG_DUMP_TREE  = 0x08
DBG_NO_IR      = 0x10
DBG_DUMP_IR    = 0x20
DBG_NO_CODE    = 0x40

DBG_ALL_DECL = DBG_DUMP_GSYMS | DBG_DUMP_LSYMS  # 0x06
DBG_ALL_TREE = DBG_ALL_DECL   | DBG_DUMP_TREE   # 0x0e
DBG_ALL_IR   = DBG_ALL_TREE   | DBG_DUMP_IR     # 0x2e

#------------------------------------------------------------------------------
INFO = 0
VERB = 1
TRCE = 2

FAILURE  = '\033[91m'
SUCCESS  = '\033[92m'
WARNING  = '\033[93m'
ENDCOLOR = '\033[0m'

#------------------------------------------------------------------------------
def replace_ext(path, ext):
    base = os.path.splitext(path)[0]
    return base + "." + ext

#------------------------------------------------------------------------------
class Tester(ArgumentParser):

    def __init__(self):
        self.__find_home__()
        self.__find_cmm_path__("dbg")
        self.__find_cmm_path__("opt")
        self.__init_args__()

    def __find_home__(self):
        # fail if we're not in the c-- directory tree
        cur = os.getcwd()
        while not os.path.basename(cur).lower() == "c--":
            parent = os.path.dirname(cur)
            if parent == cur:
                raise Exception("Error: could not find c-- root directory!")
            cur = parent
        self.home = cur

    def __find_cmm_path__(self, build):
        path = os.path.join(self.home, "bin", build, "c--")
        setattr(self, build, path if os.path.exists(path) else None)

    def __init_args__(self):
        ArgumentParser.__init__(self, formatter_class=ArgumentDefaultsHelpFormatter)
        self.add_argument(
            "-p", "--phase-spec",
            help="list of phases to run",
            metavar="PHASES",
            nargs="+",
            choices=ALL_PHASES,
            default=ALL_PHASES,
            dest="phase_spec")
        self.add_argument(
            "-f", "--file-pattern",
            help="only compile files matching the given pattern",
            metavar="FILES",
            default="*.c",
            dest="file_pattern")
        self.add_argument(
            "-v", "--verbosity",
            help="set verbosity level: 0=sparse, 1=verbose, 2=trace",
            metavar="LEVEL",
            type=int,
            default=VERB,
            dest="verbosity")
        self.add_argument(
            "-g", "--grind",
            help="enable valgrind memory checks",
            action="store_true",
            default=False,
            dest="grind")
        self.add_argument(
            "-o", "--use-optimized",
            help="test with optimized build of c--",
            action="store_true",
            default=False,
            dest="opt")
        self.args = super(Tester, self).parse_args()

    def get_cmm_path(self, opt):
        path = getattr(self, "opt" if opt else "dbg")
        if path is None:
            raise Exception("Error: could not find c-- binary!")
        return path

    def out(self, verbosity, text, color=""):
        if self.args.verbosity >= verbosity:
            endcolor = "" if color is "" else ENDCOLOR
            sys.stdout.write(color + text + endcolor)

    def info(self, text, color=""):
        self.out(INFO, text, color)

    def verb(self, text, color=""):
        self.out(VERB, text, color)

    def trce(self, text, color=""):
        self.out(TRCE, text, color)

    def success(self, text):
        self.info(text, SUCCESS)

    def failure(self, text):
        self.info(text, FAILURE)

    def warning(self, text):
        self.info(text, WARNING)

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

    def __init__(self, t, phase_argv, inpath):
        self.grind    = t.args.grind
        self.def_argv = phase_argv + [ inpath ]
        self.log      = replace_ext(inpath, "vg")

    def __enter__(self):
        if not self.grind:
            return self.def_argv
        else:
            return [ "valgrind",
                     "--leak-check=full", "--show-reachable=yes", "--malloc-fill=DD",
                     "--free-fill=BB", "--track-origins=yes", "--gen-suppressions=all",
                     "--log-file=" + self.log, "-v",
                     ] + self.def_argv

    def __exit__(self, tp, v, tr):
        if self.grind:
            with open(self.log, "r+b") as log:
                pattern  = re.compile(r"""
                    (LEAK\s+SUMMARY.*
                     definitely\s+ lost:\s+0\s+bytes.*
                     indirectly\s+ lost:\s+0\s+bytes.*
                     possibly\s+   lost:\s+0\s+bytes.*
                     still\s+ reachable:\s+0\s+bytes.*
                    |All\s+heap\s+blocks\s+were\s+freed.*no\s+leaks\s+are\s+possible.*)
                    ERROR\s+SUMMARY:\s+0\s+errors.*
                    ERROR\s+SUMMARY:\s+0\s+errors.*
                    """, re.VERBOSE | re.DOTALL)
                found = re.search(pattern, mmap.mmap(log.fileno(), 0))
            if found:
                os.remove(self.log)

#------------------------------------------------------------------------------
class TesterPhase:

    def __init__(self, t, dirname, flags):
        self.cwd     = os.path.join(t.home, "tests", dirname)
        self.old_cwd = os.getcwd()
        self.flags   = flags

    def __enter__(self):
        os.chdir(self.cwd)
        return self

    def __exit__(self, typ, val, tb):
        os.chdir(self.old_cwd)

    def argv(self, t):
        return [ t.get_cmm_path(t.args.opt), "-v", hex(self.flags) ]

    def simplify_inpath(self, path):
        f = os.path.basename(path)
        b = os.path.dirname(path)
        d = os.path.basename(b)
        return os.path.join(d, f)

    def compile(self, t, inpath):
        t.verb("compiling: %s\n" % self.simplify_inpath(inpath))
        with StderrMonitor(inpath) as errors:
            with MemoryMonitor(t, self.argv(t), inpath) as argv:
                try:
                    subprocess.check_call(argv, stdout=errors, stderr=errors)
                except subprocess.CalledProcessError:
                    errors.write("c-- returned a nonzero exit code\n")
                except OSError as e:
                    errors.write("couldn't launch c--: %s\n" % e.strerror)

    def validate(self, t):
        t.info("status:")
        status = subprocess.check_output(["git", "ls-files", "-dmo"])
        if len(status) > 0:
            t.failure("\n" + status + "\n")
        else:
            t.success(" Clean!\n\n")

    def execute(self, t):
        t.info("running phase: %s\n" % os.path.basename(self.cwd))
        pattern = replace_ext(t.args.file_pattern, "c")
        for inpath in glob.iglob(pattern):
            self.compile(t, inpath)
        self.validate(t)

#------------------------------------------------------------------------------
class RealPhase(TesterPhase):

    def __init__(self, t):
        TesterPhase.__init__(self, t, REAL, DBG_ALL_IR)

    def validate(self, t):
        self.execAsmFiles(t)
        TesterPhase.validate(self, t)

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

#------------------------------------------------------------------------------
if __name__ == "__main__":

    t = Tester()

    phases = {
        DECL : TesterPhase(t, DECL, DBG_ALL_DECL | DBG_NO_IR),
        TREE : TesterPhase(t, TREE, DBG_ALL_TREE | DBG_NO_IR),
        IR   : TesterPhase(t, IR,   DBG_ALL_IR   | DBG_NO_CODE),
        ASM  : TesterPhase(t, ASM,  DBG_ALL_IR),
        REAL : RealPhase(t),
        }

    for step in t.args.phase_spec:
        with phases[step] as p:
            p.execute(t)
