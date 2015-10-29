#!/bin/sh

workdir=`pwd`
cscope_file=cscope.files

# ignore folder
ignore_folder="-type d \
              ( -name svn -o -name CVS -o -name hg -o \
                -name git -o -name .repo -o \
                -name dl -o -name external_sdk -o -name buildroot -o \
                -name output \
              ) -prune"

target_file="( -name *.[chS] -o -name *.cpp -o -name *.hh )"

# echo -e "\n" > "$cscope_file"
# (echo \-k; echo \-q;) > "$cscope_file"

find $workdir $ignore_folder -o $target_file > "$cscope_file"

if [ -f "$cscope_file" ]; then
    cscope -bkq -i "$cscope_file"
    ctags --sort=yes -L "$cscope_file"
fi



#####################
# find $WORKDIR \
     # -path "./.git" -prune -o \
     # -path "./target" -prune -o \
     # -path "./tftp" -prune -o \
     # -path "./.repo" -prune -o \
     # -path "./dl" -prune -o \
     # -path "./external_sdk" -prune -o \
     # -path "./output" -prune -o \
     # -name "*.[ch]" -o \
     # -name "*.cpp" -o \
     # -name "*.hh" -o \
     # -name "[Cc]onfigure" -o \
     # -name "*.conf" -o \
     # -name "*.config" -o \
     # -name "*.cfg" \
     # >> "$cscope_file"


