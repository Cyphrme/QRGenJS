#!/usr/bin/env bash


file=qrgen.js
match="//////////////////////////////Regex_match_for_truncation_for_umd"
line_num=$(grep -n "$match" $file | cut -d : -f 1)
echo "Line number for truncation: $line_num"
head -n $(($line_num - 1)) $file > qrgen_nomod.js


esbuild qrgen_nomod.js --minify --outfile=qrgen.min.js
esbuild qrapp.js --minify --outfile=qrapp.min.js

rm qrgen_nomod.js

# Add back in UMD Module.  
tail -n +$line_num $file >> qrgen.min.js



