FROM python:3.8

WORKDIR /scraper_main

ADD ozonparser_selenium.py .

ADD chromedriver.exe .

RUN mv chromedriver.exe /usr/local/bin

ADD requirements.txt .

RUN apt-get upgrade

RUN apt-get update

RUN apt-get install -y libxss1

RUN apt-get install -y libappindicator1

RUN apt-get install -y libindicator7

RUN apt-get install -y fonts-liberation

RUN apt-get install -y libasound2

RUN apt-get install -y libatk-bridge2.0-0

RUN apt-get install -y libatspi2.0-0

RUN apt-get install -y libdrm2

RUN apt-get install -y libgbm1

RUN apt-get install -y libgtk-3-0

RUN apt-get install -y libnspr4

RUN apt-get install -y libnss3

RUN apt-get install -y libxkbcommon0

RUN apt-get install -y libxshmfence1

RUN apt-get install -y xdg-utils

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN dpkg -i google-chrome*.deb

RUN apt-get install -y -f

RUN pip install -r requirements.txt

CMD [ "python", "ozonparser_selenium.py" ]
