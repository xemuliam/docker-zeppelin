FROM       xemuliam/zeppelin-base:0.7.0
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
COPY       start_zeppelin.sh /${ZEPPELIN_HOME}/
WORKDIR    ${ZEPPELIN_HOME}
RUN        chmod +x ./start_zeppelin.sh
CMD        ./start_zeppelin.sh
