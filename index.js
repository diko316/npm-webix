'use strict';

var webix;

require("./webix_debug.js");

// must not be loaded by default
//require("./webix.css");

if (typeof global.webix === 'undefined') {
    throw new Error("Webix global variable do not exist.");
}

webix = global.webix;
webix["default"] = webix;

module.exports = webix;


