FROM anichols/jenkins

ADD http://archive.apache.org/dist/mesos/0.19.0/mesos-0.19.0.tar.gz /opt/mesos-0.19.0.tar.gz
WORKDIR /opt
RUN apt-get update && apt-get -f install build-essential
RUN tar xzf mesos-0.19.0.tar.gz && ln -s mesos-0.19.0 mesos && cd mesos && mkdir build && cd build && ../configure

