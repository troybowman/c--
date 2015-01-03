#!/usr/bin/env python

import sys, os, glob, subprocess, re

#------------------------------------------------------------------------------
class Tester:

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

    phases = {
        "syms" : DBG_ALL_SYMS | DBG_NO_IR,          # 0x16
        "tree" : DBG_ALL_TREE | DBG_NO_IR,          # 0x1e
        "ir"   : DBG_ALL_IR   | DBG_NO_CODE,        # 0x6e
        "mips" : DBG_ALL_IR,                        # 0x2e
        }

    all_phases = [ "syms", "tree", "ir", "mips" ]

    def __init__(self, argv):
        self.phase_spec = self.all_phases if len(argv) == 1 else argv[1].split(',')
        # TODO:
        #cwd = os.getcwd()
        #last_child = cwd
        #cur = os.path.dirname(cwd)
        #while not os.path.basename(cur).lower().startswith("idasrc"):
            #last_child = cur
            #parent = os.path.dirname(cur)
            #if parent == cur:
                #break
            #cur = parent
        #idahome = last_child
        self.cmm = os.path.join("..", "bin", "c--")
        if not os.path.exists(self.cmm):
            print "error, can't find c-- binary"
            exit()

    def compile(self, inpath, flags):
        print "compiling: %s" % inpath
        outpath = re.sub("input/", "output/",
                    re.sub("\.c", ".asm",
                      inpath))
        args = [ self.cmm, "-v", hex(flags), "-o", outpath, inpath ]
        errpath = re.sub("\.asm", ".stderr", outpath)
        with open(errpath, "w") as errfile:
            try:
                subprocess.call(args, stdout=errfile, stderr=errfile)
            except OSError as e:
                errfile.write("couldn't launch c--: %s\n" % e.strerror)
            except:
                errfile.write("idk wtf happened\n")
                raise
        if os.path.getsize(errpath) == 0:
            os.remove(errpath)

    def run(self):
        for p in self.phase_spec:
            path = os.path.join("input", p, "*.c")
            for inpath in glob.iglob(path):
                self.compile(inpath, self.phases[p])


#------------------------------------------------------------------------------
t = Tester(sys.argv)
t.run()

# #TODO: automatically report changed files
