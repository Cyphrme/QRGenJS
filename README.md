# qrgenjs

https://cyphrme.github.io/qrgenjs/

Code used for https://cyphr.me/qrgen.

An unofficial fork with minor tweaks to our favorite Javascript QR code generator.  
https://www.nayuki.io/page/qr-code-generator-library

See also:
Typescript repo:
https://github.com/nayuki/QR-Code-generator/tree/master/typescript-javascript


Github issue:
https://github.com/nayuki/QR-Code-generator/issues/155



Great article about how QR codes work:

https://typefully.com/DanHollick/qr-codes-T7tLlNi


# Developement
TypeScript Compiling, `esbuild` minification, and UMD Module.


The demo (index.html) is with "old" code, but works for our purposes.  

```javascript
esbuild qrgen_no_mod.js --minify --outfile=qrgen.min.js && cat module_append.txt >> qrgen.min.js

```


## 1.8.0 
```
tsc --strict --lib DOM,DOM.Iterable,ES6 --target ES6 1.8.0/ts/qrcodegen.ts --outFile 1.8.0/qrgen.js
esbuild 1.8.0/qrgen.js --minify --outfile=1.8.0/qrgen.min.js && cat module_append.txt >> 1.8.0/qrgen.min.js

```



## 1.8.0 Demo
Github link to live page: https://cyphrme.github.io/qrgenjs/1.8.0/demo/demo.html


Currently, we don't know how to make `app.js` with `tsc` (because of compile issues with dependencies), so to manually split the file, grab `var app; (function (app) {` (around line 838) and down into `app.js` and include  `"use strict";` as the first line *before* minification.  

```sh
tsc --strict --lib DOM,DOM.Iterable,ES6 --target ES6 nayuki/ts/qrcodegen.ts nayuki/ts/qrcodegen-input-demo.ts nayuki/ts/qrcodegen.ts --outFile 1.8.0_demo/qrgen.js
```



#### Compiling TypeScript to Javascript with the demo and qrcodegen combined:
We don't recommend if expecting to import individual Javascript files in your project.

```sh
tsc --strict --lib DOM,DOM.Iterable,ES6 --target ES6 qrcodegen.ts qrcodegen-input-demo.ts
tsc --strict --lib DOM,DOM.Iterable,ES6 --target ES6 qrcodegen.ts qrcodegen-output-demo.ts
```


## UMD Module:
Making file/module accessible through the global 'window'.
Taken from
https://github.com/paulmillr/noble-secp256k1/releases/tag/1.6.3
and
https://stackoverflow.com/a/63751410/15147681
See also:
https://github.com/evanw/esbuild/issues/507#issuecomment-1221091273

```javascript
(function(global, factory) {
	typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports) :
		typeof define === 'function' && define.amd ? define(['exports'], factory) :
		(global = typeof globalThis !== 'undefined' ? globalThis : global || self, factory(global.qrgen = qrcodegen));
})(this, (function(exports) {

	Object.defineProperty(exports, '__esModule', {
		value: true
	});
}));
```

----------------------------------------------------------------------
# Attribution, Trademark notice, and License
qrgen Copyright (c) Project Nayuki. (MIT License)
https://www.nayuki.io/page/qr-code-generator-library

"Cyphr.me" is a trademark of Cypherpunk, LLC. The Cyphr.me logo is all rights
reserved Cypherpunk, LLC and may not be used without permission.
