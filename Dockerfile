FROM ucsdets/datahub-base-notebook:2022.2-stable

USER root

COPY spark.yml /tmp
RUN conda env create -f /tmp/spark.yml

# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

RUN conda run -n pyspark /bin/bash -c "ipython kernel install --name=spark"

RUN conda run -n variant_calling /bin/bash -c "ipython kernel install --name=spark"

USER jovyan
