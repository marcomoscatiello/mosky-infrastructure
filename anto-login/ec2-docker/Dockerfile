from ubuntu:latest


RUN mkdir -p /my_script
WORKDIR /my_script

COPY a_script.py requirements.txt ./


RUN apt-get update && apt-get install -y python3 python3-pip curl vim wget net-tools 

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz &&  sh -c 'tar -x geckodriver -zf geckodriver-v0.26.0-linux64.tar.gz -O > /usr/bin/geckodriver' && chmod +x /usr/bin/geckodriver && rm geckodriver-v0.26.0-linux64.tar.gz

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y firefox xvfb


RUN pip3 install -r requirements.txt

ENV PYTHONIOENCODING=utf8

#RUN echo $DISPLAY
RUN Xvfb :5 -ac &
ENV DISPLAY=:5

#CMD ["xvfb-run -a python3 a_script.py"]

CMD xvfb-run -a python3 a_script.py

#ENTRYPOINT ["xvfb-run", "-a", "python3", "a_script.py"]
#command to run script
#xvfb-run -a python3 a_script.py
