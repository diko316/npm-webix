'use strict';

require("./webix_debug.js");
require("./webix.css");

if (typeof global.webix === 'undefined') {
    throw new Error("Webix global variable do not exist.");
    
}

module.exports = global.webix;


