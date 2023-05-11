FROM continuumio/anaconda3:2023.03-1
RUN conda create -c bioconda -n snakemake snakemake
RUN git clone https://github.com/workflow-development-interest-group/MPRAsnakeflow.git
RUN conda init bash
#RUN conda activate snakemake
#:RUN snakemake --use-conda --configfile conf/config.yaml -n


