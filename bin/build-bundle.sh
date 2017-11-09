#!/bin/sh

ROOT=$(dirname $(dirname $(readlink -f $0)))

cd "${ROOT}"

echo "building... ${1}";

# rebuilding webix
cat src/webix_global_top_fix.js > src/webix_clean.js

# cleanup webix bad practices
cat webix_debug.js | \
    sed -r 's|global = this|/* never overwrite "global" var */|g' | \
    sed -r 's/\beval\(/evilCall(/g' >> src/webix_clean.js

cat src/webix_global_bottom_fix.js >> src/webix_clean.js

case "${1}" in
    "start")
        export BUILD_MODE=devel
        
        #cp node_modules/libcore/dist/libcore.js dist/ || exit $?
        node_modules/.bin/rollup --config || exit $?
        ;;
        
    "sync-demo")
        export BUILD_MODE=demo
        node_modules/.bin/rollup --config 'rollup.config.demo.js' || exit $?
        ;;
        
    "build")
        export BUILD_MODE=production
        node_modules/.bin/rollup --config || exit $?
        echo "built.";
        ;;
        
    "build-optimized")
        export BUILD_MODE=compressed
        node_modules/.bin/rollup --config || exit $?
        ;;
        
    *)
        export BUILD_MODE=unit-test
        xvfb-run node_modules/.bin/karma start karma.config.js || exit $?
        #node_modules/.bin/karma start karma.config.js || exit $?
        ;;
esac

exit 0
