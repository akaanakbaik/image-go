#!/bin/bash
set -e

cd /home/container

if [[ -n "${STARTUP:-}" ]]; then
    exec /bin/bash -c "exec ${STARTUP}"
fi

exec go version
