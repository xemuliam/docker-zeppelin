#!/bin/bash

set -e

tail -F ${ZEPPELIN_HOME}/logs/zeppelin-*.log &
${ZEPPELIN_HOME}/bin/zeppelin.sh run
