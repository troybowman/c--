#!/usr/bin/env python
import sys, os, glob, subprocess, re

cmm = os.path.join("..", "bin", "c--")

if not os.path.exists(cmm):
    print "error, can't find c-- binary"
    exit()

DBG_SUMMARY_MASK = 1 # b0011

#------------------------------------------------------------------------------
for infile in glob.iglob("input/*.c"):
    print "compiling: %s" % infile

    # don't log any symbol table/syntax tree info for a file with errors in it.
    # (this bahavior is undefied at the moment)
    if os.path.splitext(infile)[0].endswith("_err"):
        args = [ cmm, infile ]
    else:
        args = [ cmm, "-v", str(DBG_SUMMARY_MASK), infile ]

    outname = re.sub("input/", "output/",
                    re.sub("\.c", ".s",
                        infile))

    with open(outname, "w") as outfile:
        try:
            subprocess.call(args, stdout=outfile, stderr=outfile)
        except OSError as e:
            outfile.write("couldn't launch c--: %s" % e.strerror)
        except:
            outfile.write("idk wtf happened")
            raise

#------------------------------------------------------------------------------
# soon to come: automatically report changed files
