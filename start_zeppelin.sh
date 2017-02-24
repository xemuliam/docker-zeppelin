#!/bin/sh

set -e

# Zeppelin config
rm -f ${ZEPPELIN_HOME}/conf/zeppelin-env.sh

if [ ! -z "$HOMESCREEN" ]; then
  cp ${ZEPPELIN_HOME}/conf/zeppelin-env.sh.template ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  echo "export ZEPPELIN_NOTEBOOK_HOMESCREEN=${HOMESCREEN}" >> ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  
  if [ ! -z "$HOMESCREEN_HIDE" ]; then
    echo "export ZEPPELIN_NOTEBOOK_HOMESCREEN_HIDE=true" >> ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  else
    echo "export ZEPPELIN_NOTEBOOK_HOMESCREEN_HIDE=false" >> ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  fi
fi

${ZEPPELIN_HOME}/bin/zeppelin-daemon.sh start; sleep 5; tail -F ${ZEPPELIN_HOME}/logs/zeppelin-*.log
