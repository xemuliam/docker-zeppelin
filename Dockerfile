FROM       xemuliam/zeppelin-base:0.6.2
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
ENV        HOMESCREEN="" \
           HOMESCREEN_HIDE=""
RUN        apk add --update \
           python2 \
           python2-dev \
           py2-pip \
           && pip install --upgrade pip \
           && pip install py4j \
           && rm -rf /var/cache/apk/*
COPY       . /${ZEPPELIN_HOME}/
WORKDIR    ${ZEPPELIN_HOME}
RUN        chmod +x ./start_zeppelin.sh
CMD        ./start_zeppelin.sh
