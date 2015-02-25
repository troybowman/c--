#!/usr/bin/env python

import sys, os, glob, subprocess, re

#------------------------------------------------------------------------------
class Tester:

    FAILURE  = '\033[91m'
    SUCCESS  = '\033[92m'
    WARNING  = '\033[93m'
    ENDCOLOR = '\033[0m'

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
        argv = self.argv(t) + [ inpath ]
        with StderrMonitor(inpath) as errors:
            try:
                subprocess.call(argv, stdout=errors, stderr=errors)
            except OSError as e:
                errors.write("couldn't launch c--: %s\n" % e.strerror)
            except:
                errors.write("idk wtf happened\n")
                raise

    def execute(self, t):
        pattern = os.path.join("*.c")
        for inpath in glob.iglob(pattern):
            print "compiling: %s" % simplify_inpath(inpath)
            self.compile(t, inpath)
        self.validate(t)

    def status(self, t):
        print "checking diffs for phase %s..." % os.path.basename(self.dir)
        status = subprocess.check_output(["git", "ls-files", "-dmo"])
        if len(status) > 0:
            print t.FAILURE + status + t.ENDCOLOR
        else:
            print t.SUCCESS + "Clean!" + t.ENDCOLOR

    def execAsmFiles(self, t):
        for asm in glob.iglob("*.asm"):
            with open(replace_ext(asm, "out"), "w") as outfile:
                try:
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
        return [ t.cmmdbg(), "-v", hex(self.flags) ]

#------------------------------------------------------------------------------
class RealPhase(DbgPhase):

    def __init__(self, dir):
        DbgPhase.__init__(self, dir, DbgPhase.DBG_ALL_IR)

    def validate(self, t):
        self.execAsmFiles(t)
        self.status(t)

#------------------------------------------------------------------------------
class OptPhase(TesterPhase):

    def __init__(self, dir):
        TesterPhase.__init__(self, dir)

    def argv(self, t):
        return [ t.cmmopt() ]

    def execute(self, t):
        print t.WARNING + "opt: TODO" + t.ENDCOLOR

    def validate(self, t):
        #self.execAsmFiles()
        #self.status()
        pass

#------------------------------------------------------------------------------
if __name__ == "__main__":

    t = Tester()

    SYMS = "syms"
    TREE = "tree"
    IR   = "ir"
    ASM  = "asm"
    REAL = "real"
    OPT  = "opt"

    tests = os.path.join(t.cmmhome(), "tests")

    phases = {
        SYMS : DbgPhase(  os.path.join(tests, SYMS),  DbgPhase.DBG_ALL_SYMS | DbgPhase.DBG_NO_IR),
        TREE : DbgPhase(  os.path.join(tests, TREE),  DbgPhase.DBG_ALL_TREE | DbgPhase.DBG_NO_IR),
        IR   : DbgPhase(  os.path.join(tests, IR  ),  DbgPhase.DBG_ALL_IR   | DbgPhase.DBG_NO_CODE),
        ASM  : DbgPhase(  os.path.join(tests, ASM ),  DbgPhase.DBG_ALL_IR),
        REAL : RealPhase( os.path.join(tests, REAL)),
        OPT  : OptPhase(  os.path.join(tests, OPT )),
        }

    if len(sys.argv) == 1:
        phase_spec = [ SYMS, TREE, IR, ASM, REAL, OPT ]
    else:
        phase_spec = sys.argv[1].split(',')

    for step in phase_spec:
        with phases[step] as p:
            p.execute(t)
