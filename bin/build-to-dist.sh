#!/bin/sh

ROOT=$(dirname $(dirname $(readlink -f $0)))
CURRENT_DIR=$(pwd)
TARGET=${ROOT}/dist
TARGET_GID=$(stat -c '%g' ${TARGET})
TARGET_UID=$(stat -c '%u' ${TARGET})

cd "${ROOT}"

if npm run test; then
    
    echo "Proceed to build."
    bin/build-bundle.sh build
    bin/build-bundle.sh build-optimized
    # npm run build
    # npm run build-optimized

    find "${TARGET}/" -maxdepth 1 -name ".*" && \
        rm -Rf $(find "${TARGET}/" -maxdepth 1 -name ".*")
    
    if chown $(stat -c '%u:%g' ${TARGET}) -R ${TARGET}/*; then
        echo "Built all sources to output directory."
        
    else
        echo "No builds as for now."
        
    fi
    
    exit 0

else
    echo "Unable to build."
    exit 1
fi
