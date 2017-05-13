FROM centos:7

ENV AMC_VERSION 4.0.11

ADD run.sh /run.sh

RUN yum install -y initscripts wget python27 gcc python-devel \
 && wget http://www.aerospike.com/download/amc/$AMC_VERSION/artifact/el6 -O /tmp/aerospike.rpm \
 && rpm -ivh /tmp/aerospike.rpm \
 && echo "" > /var/log/amc/amc.log \
 && chmod a+x /run.sh

EXPOSE 8081

CMD /run.sh