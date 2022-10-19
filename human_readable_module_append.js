(function (global, factory) {
	typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports) :
		typeof define === 'function' && define.amd ? define(['exports'], factory) :
		(global = typeof globalThis !== 'undefined' ? globalThis : global || self, factory(global.qrgen = qrcodegen));
})(this, (function (exports) {

	Object.defineProperty(exports, '__esModule', {
		value: true
	});
}));