FROM node:slim

MAINTAINER Rob Holmes (https://github.com/robholmes)

WORKDIR /tmp

RUN npm install -g protractor@3.1.1 cucumber && \
    webdriver-manager update && \
    apt-get update && \
    apt-get install -y xvfb wget openjdk-7-jre && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    rm google-chrome-stable_current_amd64.deb && \
    mkdir /protractor && \
    cd /protractor && \
    npm install chai chai-as-promised && \
    npm install --save-dev protractor-cucumber-framework

WORKDIR /protractor
