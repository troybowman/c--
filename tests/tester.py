#!/usr/bin/env python
import sys, os, glob, subprocess, re

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
cmm = os.path.join("..", "bin", "c--")

if not os.path.exists(cmm):
    print "error, can't find c-- binary"
    exit()

DBG_SUMMARY_MASK = 15 # b1111

dirs = ["*"] if len(sys.argv) < 2 else sys.argv[1].split(",")

#------------------------------------------------------------------------------
for d in dirs:
    path = os.path.join("input", d, "*.c")
    for infile in glob.iglob(path):
        print "compiling: %s" % infile

        args = [ cmm, "-v", str(DBG_SUMMARY_MASK), infile ]

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

#------------------------------------------------------------------------------
# #TODO: automatically report changed files
