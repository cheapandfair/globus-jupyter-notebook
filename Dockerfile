FROM quay.io/jupyter/scipy-notebook

LABEL org.opencontainers.image.description "Docker image for JupyterHub based on Jupyter Docker Stacks with the Globus tools installed"

RUN mamba install --yes 'gh' 'globus-sdk' 'globus-cli' 'nbgitpuller' && \
    mamba clean --all -f -y && \
    python -m pip install 'bdbag' && \
    python -m pip cache purge && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
