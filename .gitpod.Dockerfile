FROM gitpod/workspace-full

USER gitpod

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /workspace/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh

COPY gitpod/environment.yml . 

# Initialize Conda 
# install and use mamba as the dependency solver
# install packages for specifiedenvironment
RUN /workspace/miniconda/bin/conda update -n base conda && \
    /workspace/miniconda/bin/conda config --set always_yes yes \
    /workspace/miniconda/bin/conda create -f environment.yml