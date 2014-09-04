# Mostly taken from adnichols/docker-jenkins forked from aespinosa/docker-jenkins
FROM ubuntu:12.04
RUN apt-get update && apt-get install -y build-essential openjdk-6-jdk maven python-dev libz-dev libcurl4-gnutls-dev libsasl2-dev rubygems git lsb-release && gem install puppet && ln -sf /jenkins /root/.jenkins && ln -s /usr/lib/jvm/java-6-openjdk-amd64/jre/lib/amd64/server/libjvm.so /usr/lib/libjvm.so ; mkdir /jenkins ; puppet module install rtyler-jenkins ; puppet module install rtyler-jenkins ; puppet module install opentable-jenkins_job_builder
ADD site.pp /etc/puppet/site.pp
ADD http://archive.apache.org/dist/mesos/0.19.1/mesos-0.19.1.tar.gz /tmp/mesos-0.19.1.tar.gz
WORKDIR /tmp
RUN tar xzf mesos-0.19.1.tar.gz && cd mesos-0.19.1 && mkdir build && cd build && ../configure && make && make install && cd /tmp && rm -rf mesos* && puppet apply /etc/puppet/site.pp
WORKDIR /jenkins
EXPOSE 8080
VOLUME ["/jenkins"]
CMD /usr/bin/java -jar /usr/share/jenkins/jenkins.war

