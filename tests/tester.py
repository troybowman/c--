import sys, os, glob, subprocess, re

cmm = os.path.join("..", "c--")

if not os.path.exists(cmm):
    print "error, can't find c-- binary"
    exit()

#------------------------------------------------------------------------------
for infile in glob.iglob("input/*.c"):
    print "compiling: %s" % infile

    outname = re.sub("input/", "output/",
                     re.sub("\.c", ".s", infile))

    with open(outname, "w") as outfile:
        try:
            subprocess.call([cmm, infile], stdout=outfile, stderr=outfile)
        except OSError as e:
            outfile.write("couldn't launch c--: %s" % e.strerror)
        except:
            outfile.write("idk wtf happened: %s", sys.exec_info()[0])
            raise

#------------------------------------------------------------------------------
# soon to come: automatically report changed files
