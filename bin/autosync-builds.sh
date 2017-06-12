#!/bin/sh

TOOLS=$(dirname $(readlink -f $0))

auto-sync

${APP_TOOLS}/watcher/watch.sh "${PROJECT_ROOT}/index.js" "${TOOLS}/build-to-dist.sh"
