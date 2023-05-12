FROM continuumio/miniconda3:latest
RUN conda create -c bioconda -n snakemake snakemake
RUN git clone https://github.com/workflow-development-interest-group/MPRAsnakeflow.git
RUN cd MPRAsnakeflow
RUN conda create -c bioconda -c conda-forge -n mprasnakeflow snakemake sra-tools
RUN mkdir -p assoc_basic/data

# Make RUN commands use `bash --login`:
SHELL ["/bin/bash", "--login", "-c"]

# Initialize conda in bash config fiiles:
RUN conda init bash
RUN conda activate mprasnakeflow