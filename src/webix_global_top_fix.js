'use strict';


var nodeGlobal = (function (glob) {
                    // this is true when running in browser
                    if (typeof glob.global === "undefined") {
                        glob.global = glob;
                    }
                    return glob;
                })(global),
    webix = nodeGlobal.webix;

function evilCall(code) {
    var Fun = evilCall.constructor;
    return (new Fun('global', 'with (global) {' + code + '}'))(nodeGlobal);
}

nodeGlobal.evilCall = evilCall;
