FROM ucsdets/spark-master:2021.5.1

USER root

RUN conda install -c anaconda cudatoolkit=11.2 -y

# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Update these in spec.yml according to https://pytorch.org/get-started/locally/
ARG TORCH_VER="1.7.1+cu101"
ARG TORCH_VIS_VER="0.8.2+cu101"
ARG TORCH_AUD_VER="0.7.2"

# torch must be installed separately since it requires a non-pypi repo. See stable version above
RUN pip install torch==${TORCH_VER} torchvision==${TORCH_VIS_VER} torchaudio==${TORCH_AUD_VER} \
	-f https://download.pytorch.org/whl/torch_stable.html && \
	fix-permissions $CONDA_DIR && \
	fix-permissions /home/$NB_USER

USER jovyan
