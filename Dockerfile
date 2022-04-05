FROM ucsdets/scipy-ml-notebook:2022.2-stable

USER root

RUN pip install pyspark xgboost

# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# https://stackoverflow.com/questions/31841509/pyspark-exception-java-gateway-process-exited-before-sending-the-driver-its-po
RUN apt-get update && apt-get install openjdk-8-jdk -y

USER jovyan