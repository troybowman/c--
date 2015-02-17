#!/usr/bin/env python

import sys, os, glob, subprocess, re

#------------------------------------------------------------------------------
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

FAILURE  = '\033[91m'
SUCCESS  = '\033[92m'
WARNING  = '\033[93m'
ENDCOLOR = '\033[0m'

SYMS = "syms"
TREE = "tree"
IR   = "ir"
ASM  = "asm"
REAL = "real"
OPT  = "opt"

phase_names = [ SYMS, TREE, IR, ASM, REAL, OPT ]

#------------------------------------------------------------------------------
def replace_ext(path, ext):
    base = os.path.splitext(path)[0]
    return base + "." + ext

def simplify_inpath(path):
    f = os.path.basename(path)
    b = os.path.dirname(path)
    d = os.path.basename(b)
    return os.path.join(d, f)

#------------------------------------------------------------------------------
class StderrMonitor:

    def __init__(self, outpath):
        self.errpath = replace_ext(outpath, "stderr")

    def __enter__(self):
        self.errfile = open(self.errpath, "w")
        return self.errfile

    def __exit__(self, t, v, tr):
        self.errfile.close()
        if os.path.getsize(self.errpath) == 0:
            os.remove(self.errpath)

#------------------------------------------------------------------------------
class Directory:

    def __init__(self, target):
        self.prev = os.getcwd()
        self.target = target

    def __enter__(self):
        os.chdir(self.target)
        return self

    def __exit__(self, t, v, tr):
        os.chdir(self.prev)

#------------------------------------------------------------------------------
class TesterPhase:

    def __init__(self, t, name):
        self.t      = t
        self.input  = os.path.join(t.cmmhome(), "tests", "input",  name)
        self.output = os.path.join(t.cmmhome(), "tests", "output", name)
        self.name   = name

    def compile(self, inpath):
        outfile = replace_ext(os.path.basename(inpath), "asm")
        outpath = os.path.join(self.output, outfile)
        argv = self.argv() + [ "-o", outpath, inpath ]
        with StderrMonitor(outpath) as errors:
            try:
                subprocess.call(argv, stdout=errors, stderr=errors)
            except OSError as e:
                errors.write("couldn't launch c--: %s\n" % e.strerror)
            except:
                errors.write("idk wtf happened\n")
                raise

    def execute(self):
        pattern = os.path.join(self.input, "*.c")
        for inpath in glob.iglob(pattern):
            print "compiling: %s" % simplify_inpath(inpath)
            self.compile(inpath)

    def status(self):
        print "checking diffs for phase %s..." % self.name
        with Directory(self.output):
            status = subprocess.check_output(["git", "ls-files", "-dmo"])
            if len(status) > 0:
                print FAILURE + status + ENDCOLOR
            else:
                print SUCCESS + "Clean!" + ENDCOLOR

    def validate(self):
        self.status()

#------------------------------------------------------------------------------
class SymsPhase(TesterPhase):

    def __init__(self, t):
        TesterPhase.__init__(self, t, SYMS)

    def argv(self):
        return [ self.t.cmmdbg(), "-v", hex(DBG_ALL_SYMS | DBG_NO_IR) ]

#------------------------------------------------------------------------------
class TreePhase(TesterPhase):

    def __init__(self, t):
        TesterPhase.__init__(self, t, TREE)

    def argv(self):
        return [ self.t.cmmdbg(), "-v", hex(DBG_ALL_TREE | DBG_NO_IR) ]

#------------------------------------------------------------------------------
class IrPhase(TesterPhase):

    def __init__(self, t):
        TesterPhase.__init__(self, t, IR)

    def argv(self):
        return [ self.t.cmmdbg(), "-v", hex(DBG_ALL_IR | DBG_NO_CODE) ]

#------------------------------------------------------------------------------
class AsmPhase(TesterPhase):

    def __init__(self, t):
        TesterPhase.__init__(self, t, ASM)

    def argv(self):
        return [ self.t.cmmdbg(), "-v", hex(DBG_ALL_IR) ]

#------------------------------------------------------------------------------
class SpimRunner(TesterPhase):

    def __init__(self, t, name):
        TesterPhase.__init__(self, t, name)

    def validate(self):
        # TODO: run all asm files and check output
        #self.status()
        pass

#------------------------------------------------------------------------------
class OptPhase(SpimRunner):

    def __init__(self, t):
        SpimRunner.__init__(self, t, OPT)

    def argv(self):
        return [ self.t.cmmopt() ]

    def execute(self):
        print WARNING + "opt: TODO" + ENDCOLOR

    def validate(self):
        pass

#------------------------------------------------------------------------------
class RealPhase(SpimRunner):

    def __init__(self, t):
        SpimRunner.__init__(self, t, REAL)

    def argv(self):
        return [ self.t.cmmdbg(), "-v", hex(DBG_ALL_IR) ]

    def execute(self):
        print WARNING + "real: TODO" + ENDCOLOR

    def validate(self):
        pass

#------------------------------------------------------------------------------
class Tester:

    def __init__(self):
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

    def cmmhome(self):
        return self.home

    def cmmdbg(self):
        if self.dbg is None:
            raise Exception("Error: could not find c-- debug binary!")
        return self.dbg

    def cmmopt(self):
        if self.opt is None:
            raise Exception("Error: could not find c-- release binary!")
        return self.opt

#------------------------------------------------------------------------------
phases = {
    SYMS : SymsPhase,
    TREE : TreePhase,
    IR   : IrPhase,
    ASM  : AsmPhase,
    REAL : RealPhase,
    OPT  : OptPhase,
    }

t = Tester()

phase_spec = phase_names if len(sys.argv) <= 1 else sys.argv[1].split(',')

for p in phase_spec:
    phase = phases[p](t)
    phase.execute()
    phase.validate()
