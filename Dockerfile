FROM dockerfile/ubuntu
RUN dpkg --add-architecture i386
RUN apt-get update

# workaround for https://github.com/dotcloud/docker/issues/514
# from https://gist.github.com/henrik-muehe/6155333
RUN apt-get install libfuse2
RUN cd /tmp ; apt-get download fuse
RUN cd /tmp ; dpkg-deb -x fuse_* .
RUN cd /tmp ; dpkg-deb -e fuse_*
RUN cd /tmp ; rm fuse_*.deb
RUN cd /tmp ; echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst
RUN cd /tmp ; dpkg-deb -b . /fuse.deb
RUN cd /tmp ; dpkg -i /fuse.deb

# https://www.virtualbox.org/wiki/Linux%20build%20instructions
RUN apt-get install -y gcc g++ bcc iasl xsltproc uuid-dev zlib1g-dev libidl-dev \
                libsdl1.2-dev libxcursor-dev libasound2-dev libstdc++5 \
		libpulse-dev libxml2-dev libxslt1-dev \
                python-dev libqt4-dev qt4-dev-tools libcap-dev \
                libxmu-dev mesa-common-dev libglu1-mesa-dev \
                linux-kernel-headers libcurl4-openssl-dev libpam0g-dev \
                libxrandr-dev libxinerama-dev libqt4-opengl-dev makeself \
                libdevmapper-dev default-jdk 
RUN apt-get install -y \
                texlive-latex-base \
                texlive-latex-extra texlive-latex-recommended \
                texlive-fonts-extra texlive-fonts-recommended 
RUN apt-get install -y libc6-i386 libc6:i386 libc6-dev-i386 lib32gcc1 gcc-multilib \
                lib32stdc++6 g++-multilib
RUN apt-get install -y mkisofs libvpx1 libvpx-dev linux-headers-virtual linux-headers-generic yasm
RUN bash -c 'ln -sf $(cd /usr/src; ls -d linux-headers-*-generic | tail -1) /usr/src/linux'
WORKDIR /var/src
