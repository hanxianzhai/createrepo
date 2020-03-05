FROM centos:7

RUN set -eux; \
    localedef -i en_US -f UTF-8 en_US.UTF-8; \
    yum update -y; \
    yum install -y createrepo


COPY repo/*.repo /etc/yum.repos.d/
COPY repo/*.sh /usr/local/bin/
COPY /entrypoint.sh /
RUN chmod +x /usr/local/bin/*.sh /entrypoint.sh

VOLUME [ "/data" ]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/start.sh"]
