FROM gitpod/workspace-full

USER gitpod

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /workspace/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh

# Initialize Conda 
# install and use mamba as the dependency solver
# install packages for specifiedenvironment
RUN /workspace/miniconda/bin/conda install -n base conda-libmamba-solver && \
    /workspace/miniconda/bin/conda config --set solver libmamba && \
    /workspace/miniconda/bin/conda env create -f environment.yml