#!/usr/bin/env bash


file=qrgen.js
minfile=qrgen.min.js
match="//////////////////////////////Regex_match_for_truncation_for_umd"
line_num=$(grep -n "$match" $file | cut -d : -f 1)
echo "Line number for truncation: $line_num"
head -n $(($line_num - 1)) $file > nomod.js


esbuild nomod.js --minify --sourcemap --outfile=$minfile
esbuild qrapp.js --minify --sourcemap --outfile=qrapp.min.js

rm nomod.js


# Add back in UMD Module.  
tail -n +$(($line_num + 1)) $file >> $minfile


