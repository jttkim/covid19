FROM jttkim/bioinfo-base:0.0.12
ADD ./openstructure /usr/local/src/openstructure
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y python3-sklearn
RUN apt-get install -y cmake g++ sip-dev libtiff-dev libfftw3-dev libeigen3-dev libpng-dev python3-all python3-pyqt5 libboost-all-dev qt5-qmake qtbase5-dev libpng-dev libsqlite3-dev
RUN cd /usr/local/src/openstructure && rm -f CMakeCache.txt && cmake . -DPYTHON_LIBRARIES=/usr/lib/x86_64-linux-gnu/libpython3.6m.so -DOPTIMIZE=ON && make
RUN cd /etc/ssh && cp sshd_config sshd_config_original && sed -e '/X11DisplayOffset/s/.*/X11DisplayOffset 10/' -e '/X11UseLocalhost/s/.*/X11UseLocalhost no/' sshd_config_original > sshd_config

