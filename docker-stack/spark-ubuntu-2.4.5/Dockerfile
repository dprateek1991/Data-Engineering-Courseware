FROM ubuntu:16.04

LABEL maintainer="Prateek Dubey"

ENV SCALA_VERSION=2.11.12 \
    SCALA_HOME=/usr/share/scala

ENV APACHE_SPARK_VERSION 2.4.5
ENV HADOOP_VERSION 2.7
ENV CONDA_DIR="/opt/conda"
ENV	PATH="$CONDA_DIR/bin:$PATH"

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 wget gcc g++ ca-certificates \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp $CONDA_DIR \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3.7 \
    && conda update conda \
    && apt-get install default-jre -y \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

RUN cd "/tmp" && \
    wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    rm -rf "/tmp/"*

RUN cd /opt && \
    wget https://archive.apache.org/dist/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar xzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz --no-same-permissions && \
    mv spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark && \
    chown -R root:root spark && \
    rm spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN cd /opt && \
    mkdir -p /opt/spark/work-dir

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV SPARK_HOME /opt/spark
ENV PYTHONPATH ${SPARK_HOME}/python/lib/pyspark.zip:${SPARK_HOME}/python/lib/py4j-*.zip
ENV PYSPARK_PYTHON=$CONDA_DIR/bin/python3
ENV PYSPARK_DRIVER_PYTHON=python3

# Copy AWS, Azure, GCP jars
COPY jars/* $SPARK_HOME/jars/

# Default Event Logs
RUN mkdir -p /logs/spark-events

# Install Python Libraries
RUN conda config --system --prepend channels conda-forge && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    conda install -y --quiet --freeze-installed \
      cython==0.29.* \
      awscli==1.16.* \
      boto3==1.9.*  \
      kubernetes==1.18.* \
      python-dateutil==2.8.* \
      pytz==2019.* \
      numpy==1.17.* \
      pandas==0.24.* \
      scikit-learn \
      shapely \
      python-graphviz \
      && \
    conda clean -afy && \
    find $CONDA_DIR -follow -type f -name '*.a' -delete && \
    find $CONDA_DIR -follow -type f -name '*.pyc' -delete && \
    find $CONDA_DIR -follow -type f -name '*.js.map' -delete

RUN pip install argparse==1.* \
    python-Levenshtein

COPY entrypoint.sh /opt/

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
RUN chmod +x /sbin/tini

ENTRYPOINT [ "/opt/entrypoint.sh" ]