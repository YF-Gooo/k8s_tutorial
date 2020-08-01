#!/bin/bash
wget https://openebs.github.io/charts/openebs-operator-1.10.0.yaml
sed -i 's#quay.io#quay.mirrors.ustc.edu.cn#g' openebs-operator-1.10.0.yaml
kubectl apply -f openebs-operator-1.10.0.yaml
