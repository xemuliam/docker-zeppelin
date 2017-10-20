FROM       xemuliam/zeppelin-base:0.7.3
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
ENV        HOMESCREEN="" \
           HOMESCREEN_HIDE=""
RUN        apk add --no-cache \
               build-base \
               gfortran \
               python2 \
               python2-dev \
               py2-pip \
               freetype-dev \
               libpng-dev \
               python2-tkinter \
#               openblas-dev \
               lapack-dev \
               libxml2-dev \
               libxslt-dev \
               jpeg-dev \
           && pip install --upgrade pip \
           && pip install \
                  py4j \
                  numpy \
                  scipy \
                  pandas \
                  matplotlib
COPY       . /${ZEPPELIN_HOME}/
WORKDIR    ${ZEPPELIN_HOME}
RUN        chmod +x ./start_zeppelin.sh
CMD        ./start_zeppelin.sh
