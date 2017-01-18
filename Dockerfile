FROM       xemuliam/zeppelin-base:0.6.2
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
COPY       start_zeppelin.sh /${ZPLIN_HOME}/
COPY       zeppelin-jdbc-0.6.2.jar /${ZPLIN_HOME}/interpreter/jdbc/
WORKDIR    ${ZPLIN_HOME}
RUN        chmod +x ./start_zeppelin.sh
CMD        ./start_zeppelin.sh
