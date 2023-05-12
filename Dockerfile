FROM continuumio/miniconda3:latest
RUN conda create -c bioconda -n snakemake snakemake
RUN git clone https://github.com/workflow-development-interest-group/MPRAsnakeflow.git
RUN cd MPRAsnakeflow
RUN conda create -c bioconda -c conda-forge -n mprasnakeflow snakemake sra-tools
RUN mkdir -p assoc_basic/data

# Activate the Conda environment
RUN echo "conda activate mprasnakeflow" >> ~/.bashrc

# Set the default command to activate the environment
CMD ["conda", "run", "-n", "mprasnakeflow"]