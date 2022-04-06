FROM ucsdets/scipy-ml-notebook:2022.2-stable

USER root



RUN pip install xgboost pyspark

# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install


USER jovyan
