FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN conda create --yes -n dockerfile-practice --file /tmp/conda-linux-64.lock \
    && conda clean --all -f -y

USER ${NB_UID}

RUN echo "conda activate dockerfile-practice" >> /home/jovyan/.bashrc