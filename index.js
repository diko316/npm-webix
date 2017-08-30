'use strict';

var webix;

require("./webix_debug.js");

if (typeof global.webix === 'undefined') {
    throw new Error("Webix global variable do not exist.");
}

webix = global.webix;
webix["default"] = webix;

module.exports = webix;
