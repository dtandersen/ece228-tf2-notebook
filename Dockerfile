FROM ucsdets/scipy-ml-notebook:2019.4.6

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

USER root

RUN conda create -n ece228-tf2 python=3.7 tensorflow-gpu=2.1.0 ipykernel && \
    conda clean -afy && fix-permissions $CONDA_DIR

#RUN conda install python=3.7 tensorflow-gpu=2.1.0 && \
#    conda install -c anaconda cloudpickle && \
#    pip install torchaudio pickle-mixin && \
#     conda clean -afy && fix-permissions $CONDA_DIR

##conda install pip
##conda install numpy
#conda install jupyter notebook
#conda install matplotlib

#### There were some problems with pickle but these are the installs I
#tried.
#conda install pickle
#conda install -c anaconda cloudpickle <---- The code ended up
#working with just pickle on previous line
#pip install pickle-mixin

#### I know we will need PyTorch and Torchaudio (a signal processing
#library...) for their class projects
#pip install torchaudio <---- conda package manager has issues with
#this, pip works fine.

USER $NB_UID:$NB_GID
