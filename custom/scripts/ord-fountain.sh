#!/bin/bash

# Title.ord content
#Fade in River
#;;test
#Int Will's Bedroom
#;;comment
#Int Bloom Hall


# 1.0
#cat $file | grep .fountain | tr '\n' ' ' |  \
#xargs cat > output.fountain && screenplain output.fountain output.pdf


# 2.0
#screenplain \
#  <(cat $file \
#    | grep -v '^\s*$\|^\s*\#\|\;\;' \
#      | sed -e 's/^/"/' -e 's/$/.fountain"/' \
#        | tr '\n' ' ' \
#          | xargs cat) \
#              output.pdf


#3.0
# 1) Cat checks the list of scenes in $ordfile
# 2) grep extracts only lines without white spaces or comments
# 3) sed add quotations marks and the .fountain extension in each line
# 4) xargs prints everything (including linebreaks between files)
# 5) tail removes the first empty line
# 6) <() substitues all of this as the first argumment of screenplain

ordfile=$(find -maxdepth 1 -type f -name "*.ord" -printf %f)

if ! test -f "$ordfile"; then
    echo "File xxx.ord not found in $PWD"
    exit
fi


screenplain  \
  <(cat "$ordfile" \
    | grep -v '^\s*$\|^\s*\#\|\;\;' \
      | sed -e 's/^/"/' -e 's/$/.fountain"/' \
        | xargs awk 'FNR==1{print ""}1' \
          | tail -c +2) \
  "${ordfile%.*}.pdf"