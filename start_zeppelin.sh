#!/bin/bash

set -e

${ZEPPELIN_HOME}/bin/zeppelin.sh run; sleep 5; tail -F ${ZEPPELIN_HOME}/logs/zeppelin-*.log
