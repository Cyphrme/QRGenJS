# qrgenjs
https://cyphrme.github.io/qrgenjs

Code used for https://cyphr.me/qrgen.

An unofficial fork with minor tweaks to our favorite Javascript QR code generator.  
https://github.com/nayuki/QR-Code-generator/tree/master/typescript-javascript


Github issue:
https://github.com/nayuki/QR-Code-generator/issues/155



# Development
The demo (index.html) is with an older version, but it works and since the new
version works differently we're keeping the old version.  

## 1.8.0 Demo
All links are in this repo
- [Cyphrme changes 1.8.0 (Live page)](https://cyphrme.github.io/qrgenjs/1.8.0/cyphrme_demo.html) 
- [Unmodified Nayuki with compiling to get it to work (Live page)](https://cyphrme.github.io/qrgenjs/1.8.0/demo.html)

The root files do not use 1.8.0, but to build it, this is how it is done: 

```sh
(
	cd 1.8.0
tsc --strict --lib DOM,DOM.Iterable,ES6 --target ES6 *.ts 
esbuild qrcodegen.js --minify --outfile=qrcodegen.min.js && cat module_append.txt >> qrcodegen.min.js
)
```

## UMD Module
See https://github.com/Cyphrme/UMD_tutorial.  In short, `esbuild` has a bug with
UMD so modules have to be manually done.  See `build.sh`.


# New
# Truncate UMD from file to add it back in after minifaciton.  
file=urlform.js
match="//////////////////////////////Regex_match_for_truncation_for_umd"
line_num=$(grep -n "$match" $file | cut -d : -f 1)
echo "Line number for truncation: $line_num"
head -n $(($line_num - 1)) $file > urlform_nomod.min.js # `min.js` avoids watch loop.  


esbuild urlform_nomod.min.js --bundle --format=esm --platform=browser --minify --sourcemap --outfile=urlform.min.js
#cat module_append.js >> urlform.min.js





## Other Resources
Great article about how QR codes work: https://typefully.com/DanHollick/qr-codes-T7tLlNi


----------------------------------------------------------------------
# Attribution, Trademark notice, and License
qrgen Copyright (c) Project Nayuki. (MIT License)
https://www.nayuki.io/page/qr-code-generator-library

"Cyphr.me" is a trademark of Cypherpunk, LLC. The Cyphr.me logo is all rights
reserved Cypherpunk, LLC and may not be used without permission.
