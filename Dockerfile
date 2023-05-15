FROM continuumio/miniconda3:latest

# Install required libraries
RUN apt-get update && apt-get install -y python python3 virtualenv python3-pip  zlib1g-dev zlib1g libbz2-dev liblzma-dev wget libncurses5-dev

# Set the working directory
WORKDIR /usr/src/app

RUN git clone https://github.com/workflow-development-interest-group/MPRAsnakeflow.git
RUN conda create -c bioconda -c conda-forge -n mprasnakeflow snakemake sra-tools
# RUN mkdir -p assoc_basic/data

# Activate the Conda environment
# RUN echo "conda activate mprasnakeflow" >> ~/.bashrc

# Set the default command to activate the environment
# RUN conda run -n mprasnakeflow
# CMD ["conda", "run", "-n", "mprasnakeflow"]