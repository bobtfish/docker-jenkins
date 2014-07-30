FROM anichols/jenkins

RUN curl http://archive.apache.org/dist/mesos/0.19.0/mesos-0.19.0.tar.gz > /mesos-0.19.0.tar.gz && tar xzf /mesos-0.19.0.tar.gz

