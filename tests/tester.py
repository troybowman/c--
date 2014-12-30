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
        "code" : DBG_ALL_IR,                        # 0x2e
        }

    def __init__(self, argv):
        self.phase_spec = ["*"] if len(argv) == 0 else argv[1].split(',')
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

    def compile(self, infile, flags):
        print "compiling: %s" % infile
        args = [ self.cmm, "-v", hex(flags), infile ]
        outname = re.sub("input/", "output/",
                    re.sub("\.c", ".s",
                      infile))
        with open(outname, "w") as outfile:
            try:
                code = subprocess.call(args, stdout=outfile, stderr=outfile)
                outfile.write("# c-- exited with code: %d\n" % code)
            except OSError as e:
                outfile.write("couldn't launch c--: %s\n" % e.strerror)
            except:
                outfile.write("idk wtf happened\n")
                raise

    def run(self):
        for p in self.phase_spec:
            path = os.path.join("input", p, "*.c")
            for infile in glob.iglob(path):
                self.compile(infile, self.phases[p])


#------------------------------------------------------------------------------
t = Tester(sys.argv)
t.run()

# #TODO: automatically report changed files
