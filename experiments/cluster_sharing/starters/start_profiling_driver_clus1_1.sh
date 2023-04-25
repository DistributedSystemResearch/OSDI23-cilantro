./starters/taint_schednode.sh "--kubeconfig ./kubeconfig/cluster1_1.yaml"
kubectl apply -f ./starters/auth_default_user.yaml  --kubeconfig ./kubeconfig/cluster1_1.yaml
kubectl apply -f ./starters/config_profiling_driver_eks.yaml  --kubeconfig ./kubeconfig/cluster1_1.yaml
sleep 10
kubectl cp $(kubectl get pods  --kubeconfig ./kubeconfig/cluster1_1.yaml | awk '/cilantroscheduler/ {print $1;exit}'):/cilantro/workdirs ./workdirs_profiling_eks/ --kubeconfig ./kubeconfig/cluster1_1.yaml
sleep 10
./starters/fetch_results_clus1_1.sh
