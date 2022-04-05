FROM ucsdets/scipy-ml-notebook:2022.2-stable

USER root

RUN pip install pyspark xgboost

USER jovyan