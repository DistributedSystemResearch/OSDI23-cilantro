kubectl cp $(kubectl get pods --kubeconfig ./kubeconfig/cluster1_1.yaml | awk '/cilantroscheduler/ {print $1;exit}'):/cilantro/workdirs ./workdirs_eks/ --kubeconfig ./kubeconfig/cluster1_1.yaml
sleep 10
watch -n 30 "kubectl cp $(kubectl get pods --kubeconfig ./kubeconfig/cluster1_1.yaml | awk '/cilantroscheduler/ {print $1;exit}'):/cilantro/workdirs ./workdirs_eks/ --kubeconfig ./kubeconfig/cluster1_1.yaml && wc -l workdirs_eks/$(ls -t workdirs_eks/ | head -n 1)/root--j01_dummydataserving.csv"

# watch -n 30 "kubectl cp $(kubectl get pods | awk '/cilantroscheduler/ {print $1;exit}'):/cilantro/workdirs ./workdirs_eks/ && wc -l workdirs_eks/$(ls -t workdirs_eks/ | head -n 1)/root--j01_dummydataserving.csv"