FROM ucsdets/scipy-ml-notebook:2019.4.6

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

USER root

RUN conda create --yes --quiet -n py37-tf2 python=3.7 tensorflow-gpu=2.1.0 pip numpy matplotlib ipykernel
SHELL ["conda", "run", "-n", "py37-tf2", "/bin/bash", "-c"]

RUN conda install -c anaconda cloudpickle && \
    pip install torchaudio pickle-mixin

RUN  python -m ipykernel install --name py37-tf2 && \
    conda clean -afy && fix-permissions $CONDA_DIR

# reset shell
SHELL ["/bin/sh", "-c"]

USER $NB_UID:$NB_GID
