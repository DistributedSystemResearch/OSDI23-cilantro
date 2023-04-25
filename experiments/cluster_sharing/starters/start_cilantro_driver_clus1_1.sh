./starters/taint_schednode.sh "--kubeconfig ./kubeconfig/cluster1_1.yaml"
kubectl apply -f ./starters/auth_default_user.yaml --kubeconfig ./kubeconfig/cluster1_1.yaml
kubectl apply -f ./starters/config_cilantro_scheduler_eks.yaml --kubeconfig ./kubeconfig/cluster1_1.yaml
sleep 10
./starters/fetch_results_clus1_1.sh

