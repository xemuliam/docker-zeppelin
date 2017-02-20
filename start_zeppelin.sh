#!/bin/sh

set -e

${ZEPPELIN_HOME}/bin/zeppelin-daemon.sh start; sleep 5; tail -F ${ZEPPELIN_HOME}/logs/zeppelin-*.log
