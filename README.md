# qrgenjs
https://cyphrme.github.io/qrgenjs

Code used for https://cyphr.me/qrgen.

An unofficial fork with minor tweaks to our favorite Javascript QR code generator.  
https://github.com/nayuki/QR-Code-generator/tree/master/typescript-javascript


Github issue:
https://github.com/nayuki/QR-Code-generator/issues/155


# Developement
`esbuild` minification and UMD Module.

The demo (index.html) is with "old" code, but works for our purposes.  

```javascript
esbuild qrgen_no_mod.js --minify --outfile=qrgen.min.js && cat module_append.txt >> qrgen.min.js

```


## 1.8.0 Demo
[Github link to live page.](https://cyphrme.github.io/qrgenjs/1.8.0/cyphrme_demo.html) 
[Unmodified Nayuki](https://cyphrme.github.io/qrgenjs/1.8.0/demo.html)

The root files do not use 1.8.0, but to build it, this is how it is done: 

```sh
tsc --strict --lib DOM,DOM.Iterable,ES6 --target ES6 1.8.0/*.ts --outDir 1.8.0
esbuild 1.8.0/qrcodegen.js --minify --outfile=1.8.0/qrcodegen.min.js && cat module_append.txt >> 1.8.0/qrcodegen.min.js
```



## UMD Module
Making file accessible through using not modules or modules.
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

## Other Resources
Great article about how QR codes work: https://typefully.com/DanHollick/qr-codes-T7tLlNi

----------------------------------------------------------------------
# Attribution, Trademark notice, and License
qrgen Copyright (c) Project Nayuki. (MIT License)
https://www.nayuki.io/page/qr-code-generator-library

"Cyphr.me" is a trademark of Cypherpunk, LLC. The Cyphr.me logo is all rights
reserved Cypherpunk, LLC and may not be used without permission.
