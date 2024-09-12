FROM quay.io/jupyter/scipy-notebook

RUN mamba install --yes 'globus-sdk' 'globus-cli' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
