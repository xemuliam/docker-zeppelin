FROM       xemuliam/zeppelin-base:0.6.2
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
ENV        HOMESCREEN="" \
           HOMESCREEN_HIDE=""
COPY       start_zeppelin.sh /${ZEPPELIN_HOME}/
COPY       zeppelin-jdbc-0.6.2.jar /${ZEPPELIN_HOME}/interpreter/jdbc/
WORKDIR    ${ZEPPELIN_HOME}
RUN        chmod +x ./start_zeppelin.sh
CMD        ./start_zeppelin.sh
