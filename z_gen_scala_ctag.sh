#!/bin/bash


if [ ! -f ${HOME}/.ctags.d/scala.ctags ]; then
mkdir -p ~/.ctags.d
cat << 'EOF' > ~/.ctags.d/scala.ctags
--langdef=Scala
--map-Scala=+.scala
--kinddef-Scala=c,class,classes
--kinddef-Scala=o,object,objects
--kinddef-Scala=t,trait,traits
--kinddef-Scala=m,method,methods
--kinddef-Scala=v,variable,variables
--regex-Scala=/^[ \t]*((abstract|final|sealed|implicit|lazy|case)[ \t]+)*(private|protected)?[ \t]*class[ \t]+([a-zA-Z0-9_]+)/\4/c/
--regex-Scala=/^[ \t]*((abstract|final|sealed|implicit|lazy|case)[ \t]+)*(private|protected)?[ \t]*object[ \t]+([a-zA-Z0-9_]+)/\4/o/
--regex-Scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]+)*(private|protected)?[ \t]*trait[ \t]+([a-zA-Z0-9_]+)/\4/t/
--regex-Scala=/^[ \t]*((abstract|final|sealed|implicit|lazy|override)[ \t]+)*(private|protected)?[ \t]*def[ \t]+([a-zA-Z0-9_]+)/\4/m/
--regex-Scala=/^[ \t]*((abstract|final|sealed|implicit|lazy|override)[ \t]+)*(private|protected)?[ \t]*(val|var)[ \t]+([a-zA-Z0-9_]+)/\5/v/
EOF

fi

# Universal-Ctags supports scala language
ctags --quiet -R --languages=Scala --exclude=target --exclude=.bloop . -f tags.scala
