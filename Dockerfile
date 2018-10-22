FROM       xemuliam/zeppelin-base:0.8.0
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
ENV        HOMESCREEN="" \
           HOMESCREEN_HIDE=""
RUN        apk add --no-cache \
               build-base \
               gfortran \
               python3 \
               python3-dev \
               freetype-dev \
               libpng-dev \
               python3-tkinter \
#               openblas-dev \
               lapack-dev \
               libxml2-dev \
               libxslt-dev \
               jpeg-dev \
           && python3 -m easy_install pip \
           && ln -sf /usr/bin/python3 /usr/bin/python \
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
