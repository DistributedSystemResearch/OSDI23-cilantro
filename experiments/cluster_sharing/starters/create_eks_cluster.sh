#!/usr/bin/env bash
CONFIG_PATH=$1

eksctl create cluster -f ./starters/eks_cluster_cfg.yaml --kubeconfig ${CONFIG_PATH}
cp ${CONFIG_PATH} ~/.kube/config

echo Prepulling cray image.
kubectl create -f ./starters/prepull_cray.yaml --kubeconfig ./kubeconfig/cluster1_1.yaml
echo Prepull running now. Should complete soon. Note that this needs to be run only once after the cluster has been created with eksctl.
echo Tainting nodes now
./starters/taint_schednode.sh "--kubeconfig ${CONFIG_PATH}"