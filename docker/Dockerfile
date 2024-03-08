FROM gcr.io/kaggle-gpu-images/python:v141

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

ENV NVIDIA_VISIBLE_DEVICES all
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64
EXPOSE 9001
EXPOSE 8888


RUN pip install japanize-matplotlib mlflow logzero timm pandarallel optuna gdown lap

RUN pip install pandas==1.5.2 keplergl==0.3.2 mkl fancyimpute
RUN cp /opt/conda/pkgs/mkl-2023.1.0-h213fc3f_46344/lib/libmk* /usr/local/cuda/lib64


RUN pip install black isort
RUN pip install jupyter_contrib_nbextensions jupyterlab_code_formatter
RUN pip install wandb openai

# torchのバージョンが古いのでアップデート
# RUN pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2
RUN pip install torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cu118

# パラメータ管理用
RUN pip install omegaconf

# デフォルトではエラーで動かなかったためバージョン変更
RUN pip install datasets==2.14.7

# DeepSpeed
RUN apt-get update --allow-releaseinfo-change -y && apt-get install -y \
    libopenmpi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip install mpi4py
RUN pip install deepspeed==0.13.1

# jupyter labの表示バグ対策
RUN pip install ipywidgets==8.0.4

RUN mkdir -p $HOME/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/ \
    && mkdir -p $HOME/.jupyter/lab/user-settings/@jupyterlab/terminal-extension \
    && mkdir -p $HOME/.local/share/code-server/User

# set jupyterlab config  
RUN echo '\n\
{ \n\
    "codeCellConfig": { \n\
        "autoClosingBrackets": true, \n\
        "lineNumbers": true \n\
    } \n\
} \n\
' > $HOME/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/tracker.jupyterlab-settings
