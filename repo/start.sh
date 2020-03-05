#!/bin/bash

#同步软件包

echo 开始从mirrors.aliyun.com同步数据
reposync -n --repoid=extras7 --repoid=updates7 --repoid=base7 -p /data/repo/CentOS/7/x86_64/
reposync -n --repoid=extras8 --repoid=AppStream8 --repoid=base8 -p /data/repo/CentOS/8/x86_64/
reposync -n --repoid=centos-7-epel -p /data/repo/CentOS/epel/7/x86_64/
reposync -n --repoid=centos-8-epel --repoid=centos-8-epel-modular -p /data/repo/CentOS/epel/8/x86_64/
reposync -n --repoid=docker-ce-stable --repoid=docker-ce-edge -p /data/repo/CentOS/docker
echo 数据同步结束

#更新元数据

echo 开始更新元数据
createrepo --update /data/repo/CentOS/7/x86_64/base/
createrepo --update /data/repo/CentOS/7/x86_64/extras/
createrepo --update /data/repo/CentOS/7/x86_64/updates/
createrepo --update /data/repo/CentOS/epel/7/x86_64/
createrepo --update /data/repo/CentOS/8/x86_64/base/
createrepo --update /data/repo/CentOS/8/x86_64/extras/
createrepo --update /data/repo/CentOS/8/x86_64/AppStream/
createrepo --update /data/repo/CentOS/epel/8/x86_64/epel/
createrepo --update /data/repo/CentOS/epel/8/x86_64/epel-modular/
createrepo --update /data/repo/CentOS/7/x86_64/docker-ce-stable/
createrepo --update /data/repo/CentOS/7/x86_64/docker-ce-edge/