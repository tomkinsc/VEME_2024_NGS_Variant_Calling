FROM gitpod/workspace-full

USER gitpod

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /workspace/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh

# Initialize Conda
RUN /workspace/miniconda/bin/conda init bash

# persist ~/miniconda between gitpod timeouts
RUN echo 'create-overlay $HOME/.bashrc' > "$HOME/.runonce/1-bashrc"
