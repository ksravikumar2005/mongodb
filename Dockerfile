FROM centos:7.6.1810
RUN yum -y update && yum -y install cyrus-sasl cyrus-sasl-gssapi cyrus-sasl-plain krb5-libs libcurl libpcap lm_sensors-libs net-snmp net-snmp-agent-libs openldap openssl rpm-libs tcp_wrappers-libs && yum -y install https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/4.2/x86_64/RPMS/mongodb-org-4.2.0-1.el7.x86_64.rpm https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/4.2/x86_64/RPMS/mongodb-org-mongos-4.2.0-1.el7.x86_64.rpm https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/4.2/x86_64/RPMS/mongodb-org-server-4.2.0-1.el7.x86_64.rpm https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/4.2/x86_64/RPMS/mongodb-org-shell-4.2.0-1.el7.x86_64.rpm https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/4.2/x86_64/RPMS/mongodb-org-tools-4.2.0-1.el7.x86_64.rpm && yum clean all
RUN groupadd mongodb && useradd -d /home/mongodb -ms /bin/bash -g mongodb -G mongodb -p mongodb mongodb
RUN mkdir -p /data/db /data/configdb \
  && chown -R mongodb:mongodb /data/db /data/configdb
VOLUME /data/db /data/configdb
EXPOSE 27017
USER mongodb
CMD ["mongod","--bind_ip_all"]
