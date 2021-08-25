FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# The -qq implies --yes
RUN apt-get -qq update
RUN apt-get -qq install gnupg2 wget
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get -qq update
RUN apt-get -qq install krb5-user x11vnc xvfb fluxbox wmctrl google-chrome-stable nano net-tools sudo
RUN apt-get -qq clean

RUN addgroup apps
RUN adduser apps --ingroup apps
RUN mkdir -p /home/apps
RUN chown -v -R apps:apps /home/apps
RUN echo 'apps ALL=(ALL) NOPASSWD: ALL' >>  /etc/sudoers

COPY chrome.sh /bin/
COPY init.sh /tmp/
CMD /tmp/init.sh
