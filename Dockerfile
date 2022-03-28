FROM ucsdets/scipy-ml-notebook:2022.2-stable

USER root

RUN pip install pyspark==2.4.4 xgboost