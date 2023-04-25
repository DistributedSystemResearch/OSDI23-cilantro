kubectl logs -f $(kubectl get pods --kubeconfig ./kubeconfig/cluster1_1.yaml | awk '/cilantroscheduler/ {print $1;exit}') --kubeconfig ./kubeconfig/cluster1_1.yaml
