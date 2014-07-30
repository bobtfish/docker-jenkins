FROM anichols/jenkins

ADD http://archive.apache.org/dist/mesos/0.19.0/mesos-0.19.0.tar.gz /opt/mesos-0.19.0.tar.gz
WORKDIR /opt
RUN apt-get update && apt-get -f install build-essential openjdk-7-jdk maven python-dev libz-dev libcurl4-gnutls-dev libsasl2-dev
RUN tar xzf mesos-0.19.0.tar.gz && ln -s mesos-0.19.0 mesos && cd mesos && mkdir build && cd build && ../configure && make
RUN ln -s /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server/libjvm.so /usr/lib/libjvm.so

