#!/bin/sh

set -e

# Groovy interpreter
rm -f ${ZEPPELIN_HOME}/conf/zeppelin-site.xml
cp ${ZEPPELIN_HOME}/conf/zeppelin-site.xml.template ${ZEPPELIN_HOME}/conf/zeppelin-site.xml

sed -i "s@\(<value>org.apache.zeppelin.spark.SparkInterpreter.*\)\(</value.*\)@\1,org.apache.zeppelin.groovy.GroovyInterpreter\2@" ${ZEPPELIN_HOME}/conf/zeppelin-site.xml
sed -i "s@\(<value>spark,md.*\)\(</value.*\)@\1,groovy\2@" ${ZEPPELIN_HOME}/conf/zeppelin-site.xml

# Zeppelin config
if [ ! -z "$HOMESCREEN" ]; then
  cp ${ZEPPELIN_HOME}/conf/zeppelin-env.sh.template ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  echo "export ZEPPELIN_NOTEBOOK_HOMESCREEN=${HOMESCREEN}" >> ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  
  if [ ! -z "$HOMESCREEN_HIDE" ]; then
    echo "export ZEPPELIN_NOTEBOOK_HOMESCREEN_HIDE=true" >> ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  else
    echo "export ZEPPELIN_NOTEBOOK_HOMESCREEN_HIDE=false" >> ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
  fi
else
  rm -f ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
fi

${ZEPPELIN_HOME}/bin/zeppelin-daemon.sh start; sleep 5; tail -F ${ZEPPELIN_HOME}/logs/zeppelin-*.log
