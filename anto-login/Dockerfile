from ubuntu:latest


RUN mkdir -p /my_script
WORKDIR /my_script

COPY a_script.py requirements.txt ./
RUN apt-get update && apt-get install -y python3 python3-pip curl vim wget

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

#phantomJS libraries
#RUN apt-get install -y build-essential chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1

#install phantomJS
#RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ && ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
#RUN phantomjs --version


#RUN apt-get install -y x11vnc xvfb fluxbox
RUN pip3 install -r requirements.txt
#ENV DISPLAY=yourmachine.yourdomain.com:0.0

#RUN echo $DISPLAY
RUN Xvfb :99 -ac &

#command to run script
#xvfb-run -a python3 a_script.py
