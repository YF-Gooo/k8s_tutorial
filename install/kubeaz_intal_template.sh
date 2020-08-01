#!/bin/bash
yum update
yum install python -y
export release=2.2.1
curl -C- -fLO --retry 3 https://github.com/easzlab/kubeasz/releases/download/${release}/easzup
chmod +x ./easzup
./easzup -D -d 19.03.5 -k v1.18.2
# 需要改成自己的阿里镜像加速服务
# mkdir -p /etc/docker
# tee /etc/docker/daemon.json <<-'EOF'
# {
# "registry-mirrors": ["https://****.mirror.aliyuncs.com"]
# }
# EOF
# systemctl daemon-reload
# systemctl restart docker
./easzup -S
docker exec -it kubeasz easzctl start-aio

