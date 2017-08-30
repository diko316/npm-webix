'use strict';

var wx;

import "./webix_debug.js";

if (typeof global.webix === 'undefined') {
    throw new Error("Webix global variable do not exist.");
}

wx = global.webix;

export { wx as webix };

export default wx;
