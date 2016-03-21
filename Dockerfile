FROM node:slim

MAINTAINER i6 Dev Team <dev-team@i6.io>

WORKDIR /tmp

RUN npm install -g protractor@3.1.1 cucumber@0.9.1 chai chai-as-promised protractor-cucumber-framework && \
    webdriver-manager update && \
    apt-get update && \
    apt-get install -y xvfb wget openjdk-7-jre && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    rm google-chrome-stable_current_amd64.deb && \
    mkdir /protractor && \
    cd /protractor

WORKDIR /protractor

ENV NODE_PATH /usr/local/lib/node_modules
