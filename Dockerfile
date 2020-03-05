FROM centos:8 

RUN set -eux; \
    yum update -y; \
    yum install -y yum-utils createrepo \
    echo "export LC_ALL=en_US.UTF-8"  >>  /etc/profile


COPY repo/*.repo /etc/yum.repos.d
COPY repo/*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

VOLUME [ "/data" ]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/start.sh"]
