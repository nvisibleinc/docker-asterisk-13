# Dockerfile for Asterisk 13 (ARI-based Applications)
FROM centos:latest
MAINTAINER N-Visible Technology Lab, Inc. <support@n-visibleinc.com>
RUN echo -ne '[dev-centos7-nv]\nname=CentOS-$releasever - N-Visible\nbaseurl=http://repo.nvisiblecloud.com/dev-centos$releasever-nv/\nenabled=0\ngpgcheck=0\n#gpgkey=http://n-visibleinc.com/repos/RPM-GPG-KEY-NV' > /etc/yum.repos.d/dev-centos7-nv.repo
RUN yum localinstall -y http://fedora.mirror.nexicom.net/epel/7/x86_64/e/epel-release-7-1.noarch.rpm
RUN yum install -y --enablerepo=dev-centos7-nv asterisk asterisk-hep asterisk-ari asterisk-mwi-external asterisk-snmp asterisk-odbc asterisk-devel asterisk-xmpp asterisk-debuginfo
RUN yum clean all -y
RUN rm -f /etc/asterisk/*
EXPOSE 5060
