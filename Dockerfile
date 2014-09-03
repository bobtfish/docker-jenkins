# Mostly taken from adnichols/docker-jenkins forked from aespinosa/docker-jenkins
FROM ubuntu:12.04
RUN apt-get update && apt-get install -y build-essential openjdk-6-jdk maven python-dev libz-dev libcurl4-gnutls-dev libsasl2-dev git && ln -sf /jenkins /root/.jenkins && ln -s /usr/lib/jvm/java-6-openjdk-amd64/jre/lib/amd64/server/libjvm.so /usr/lib/libjvm.so ; mkdir /jenkins
ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
ADD http://archive.apache.org/dist/mesos/0.19.1/mesos-0.19.1.tar.gz /opt/mesos-0.19.1.tar.gz
WORKDIR /opt
RUN tar xzf mesos-0.19.1.tar.gz && ln -s mesos-0.19.1 mesos && cd mesos && mkdir build && cd build && ../configure && make && make install
WORKDIR /jenkins
EXPOSE 8080
VOLUME ["/jenkins"]
CMD /usr/bin/java -jar /opt/jenkins.war $JAVA_OPTS

