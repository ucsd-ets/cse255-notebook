FROM ucsdets/spark-master:2021.5.1

USER root

RUN pip install torch==1.8.1+cu101 torchvision==0.9.1+cu101 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html && \
    pip install nbgrader==0.6.2
