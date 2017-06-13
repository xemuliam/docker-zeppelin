#!/bin/sh

set -e

rm -f ${ZEPPELIN_HOME}/conf/zeppelin-site.xml
cp ${ZEPPELIN_HOME}/conf/zeppelin-site.xml.template ${ZEPPELIN_HOME}/conf/zeppelin-site.xml

# Anonymous login
if [ ! -z "$ANONYMOUS_DENIED" ]; then sed -i '/>zeppelin.anonymous.allowed</!b;n;c\ \ <value>false</value>' ${ZEPPELIN_HOME}/conf/zeppelin-site.xml; fi

# Groovy interpreter
sed -i "s@\(<value>org.apache.zeppelin.spark.SparkInterpreter.*\)\(</value.*\)@\1,org.apache.zeppelin.groovy.GroovyInterpreter\2@" ${ZEPPELIN_HOME}/conf/zeppelin-site.xml
sed -i "s@\(<value>spark,md.*\)\(</value.*\)@\1,groovy\2@" ${ZEPPELIN_HOME}/conf/zeppelin-site.xml

# Notebook Homescreen
if [ ! -z "$HOMESCREEN" ]; then
  sed -i '/>zeppelin.notebook.homescreen</!b;n;c\ \ <value>'"${HOMESCREEN}"'</value>' ${ZEPPELIN_HOME}/conf/zeppelin-site.xml
  sed -i '/>zeppelin.notebook.homescreen.hide</!b;n;c\ \ <value>true</value>' ${ZEPPELIN_HOME}/conf/zeppelin-site.xml
fi

${ZEPPELIN_HOME}/bin/zeppelin-daemon.sh start; sleep 1; tail -F ${ZEPPELIN_HOME}/logs/zeppelin-*.log
