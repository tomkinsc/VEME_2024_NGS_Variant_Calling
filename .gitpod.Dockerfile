FROM gitpod/workspace-full

USER gitpod

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh

COPY environment.yml .

# Initialize Conda 
# install and use mamba as the dependency solver
# install packages for specifiedenvironment
RUN $HOME/miniconda/bin/conda update -n base conda && \
    $HOME/miniconda/bin/conda config --set always_yes yes && \
    $HOME/miniconda/bin/conda env create -f environment.yml