# 使用kubeaz快速搭建k8s单点集群
    https://github.com/easzlab/kubeasz/blob/master/docs/setup/quickStart.md

    kubeaz_intall.sh 快速安装docker和k8s

    退出ssh,重新登录生效
    $ kubectl version         # 验证集群版本     
    $ kubectl get node        # 验证节点就绪 (Ready) 状态
    $ kubectl get pod -A      # 验证集群pod状态，默认已安装网络插件、coredns、metrics-server等
    $ kubectl get svc -A      # 验证集群服务状态
    kube-system   kubernetes-dashboard        NodePort    10.68.199.208   <none>        443:23127/TCP            18m
    可以访问dashboard
    https://*.*.*.*:23127
    生成令牌token
    kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

# 快速部署一个存储
    openebs.sh

# 快速部署一个ingress
    wget https://github.com/easzlab/kubeasz/blob/master/manifests/ingress/traefik/traefik-ingress.yaml
    kubectl create -f /etc/ansible/manifests/ingress/traefik/traefik-ingress.yaml


# 快速清理
    清理集群 docker exec -it kubeasz easzctl destroy
    清理运行的容器 ./easzup -C
    清理容器镜像 docker system prune -a
    停止docker服务 systemctl stop docker
    删除docker文件
    umount /var/run/docker/netns/default
    umount /var/lib/docker/overlay
    rm -rf /var/lib/docker /var/run/docker