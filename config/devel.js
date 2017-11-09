'use strict';

var browsersync = require('rollup-plugin-browsersync');



function configure(config) {
    var EXT_RE = /[^\.]+$/;
    
    config.plugins.
        push(browsersync({
                server: {
                    baseDir: "dist",
                    index: "index.html"
                },
                port: 3000,
                open: false,
                files: ["dist/**/*.html",
                        "dist/**/*.js"],
                middleware: [
                            function(req, res, next) {
                                var ext = req.url.match(EXT_RE);
                                
                                switch (ext && ext[0].toLowerCase()) {
                                case 'js':
                                    console.log("requested file is js");
                                    res.setHeader('content-type',
                                                    'text/javascript');
                                }
                                
                                next();
                            }
                        ]
            }));
}
    
    
module.exports = configure;