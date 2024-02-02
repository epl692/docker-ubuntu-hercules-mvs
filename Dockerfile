#FROM	ubuntu:16.04
#FROM	ubuntu:18.04
#FROM	ubuntu:20.04
FROM	ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN   apt-get update && \
      apt-get install -y unzip wget binutils && \
      cd /opt && \
      mkdir hercules && \
      cd hercules && \
      mkdir tk5 && \
      cd tk5 && \
      wget --no-check-certificate https://www.prince-webdesign.nl/images/downloads/mvs-tk5.zip && \
      unzip mvs-tk5.zip && \
      rm  mvs-tk5.zip && \
      #echo 0010 3270 CONS >> /opt/hercules/tk4/conf/intcons.cnf && \
      rm -rf /opt/hercules/tk5/hercules/source && \
      rm -rf /opt/hercules/tk5/hercules/patches && \
      rm -rf /opt/hercules/tk5/hercules/windows && \
      apt-get -y purge wget unzip && \
      apt-get -y autoclean && apt-get -y autoremove && \
      apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
      rm -rf /var/lib/apt/lists/*

EXPOSE      3270 8038
WORKDIR     /opt/hercules/tk5/
ENTRYPOINT  ["/opt/hercules/tk5/mvs"]
