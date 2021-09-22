FROM ubuntu:20.04

LABEL maintainer="Prateek Dubey"

# Environment Variables
ENV APACHE_SPARK_VERSION 3.0.1
ENV HADOOP_VERSION 3.2
ENV CONDA_DIR="/opt/conda"
ENV	PATH="$CONDA_DIR/bin:$PATH"

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 wget gcc g++ ca-certificates \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp $CONDA_DIR \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3.8 \
    && conda update conda \
    && apt-get install default-jre -y \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

# Download Spark
RUN cd /opt && \
    wget https://archive.apache.org/dist/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar xvzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz --no-same-permissions && \
    mv spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark && \
    chown -R root:root spark && \
    rm spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN cd /opt

# Install JDK 8
RUN apt-get update -y && \
    apt-get install -y openjdk-8-jdk
    
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-openjdk-amd64/bin/java 1 && \
    update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac 1 && \
    update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/bin/java && \
    update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac

# Spark Env Variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
RUN export JAVA_HOME
ENV SPARK_HOME=/opt/spark
ENV PYTHONPATH=$SPARK_HOME/python:${SPARK_HOME}/python/lib/pyspark.zip:$SPARK_HOME/python/lib/py4j-0.10.9-src.zip
ENV PYSPARK_PYTHON=$CONDA_DIR/bin/python3
ENV PYSPARK_DRIVER_PYTHON=python3
ENV PYLIB=$SPARK_HOME/python/lib

# Download required jars from maven
RUN wget "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.11.874/aws-java-sdk-1.11.874.jar"
RUN wget "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.874/aws-java-sdk-bundle-1.11.874.jar"
RUN wget "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar"
RUN cp *.jar /opt/spark/jars/

# Config templates
COPY conf/ $SPARK_HOME/conf/

# Install python libs
RUN conda config --system --prepend channels conda-forge && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    conda install -y --quiet --freeze-installed \
      cython==0.29.* \
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

# Install AWS CLI 2.0 
RUN apt-get update -y && \
    apt-get install -y unzip curl wget && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Install Python libraries
RUN pip install argparse==1.* \
    python-Levenshtein \
    pyarrow==2.0.0 \
    s3fs==0.6.0 \
    boto3==1.17.41

# Extra dependencies
RUN pip install pyyaml ua-parser user-agents koalas==1.8.1

COPY scripts/entrypoint.sh /opt/

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
RUN chmod +x /sbin/tini

ENTRYPOINT [ "/opt/entrypoint.sh" ]