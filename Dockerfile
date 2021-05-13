FROM ubuntu

WORKDIR /scraper_main


#загрузка основных файлов в директорию
ADD ozonparser_selenium.py .

ADD requirements.txt .

RUN bash

# обновление пакетов
RUN apt-get upgrade

RUN apt-get update

RUN apt-get install sudo

RUN sudo apt-get install wget -y


# установка питона
RUN sudo apt-get install -y python3-pip


# установка требуемых зависимостей
RUN pip3 install -r requirements.txt


# загрузка и распаковка архива с драйвером
RUN sudo apt-get install unzip

RUN sudo wget https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_linux64.zip

RUN unzip chromedriver_linux64.zip


# загрузка браузера, его установка, установка его зависимостей
RUN sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb



# удаление загруженных ненужностей
RUN rm chromedriver_linux64.zip

RUN sudo apt-get remove unzip -y



# RUN sudo dpkg -i --force-all google-chrome*.deb 

# RUN sudo apt install -y -f ##во время установки попросит ввести часовой пояс

# RUN rm google-chrome-stable_current_amd64.deb


# далее нужно изменить путь к драйверу внутри
# файла программы на путь новому драйверу
