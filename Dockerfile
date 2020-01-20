# escape=`

FROM ubuntu:18.04

RUN apt-get update && apt-get -y install python3 python3-pip sudo curl gnupg2

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && `
    curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN sudo apt-get update && `
    sudo ACCEPT_EULA=Y apt-get -y install msodbcsql17 unixodbc-dev && `
    pip3 install pyodbc

ENTRYPOINT [ "/bin/bash" ]