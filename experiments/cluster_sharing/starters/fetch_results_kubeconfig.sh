CONFIG_PATH=$1
CILANTROPOD=$(kubectl get pods --kubeconfig ${CONFIG_PATH} | awk '/cilantroscheduler/ {print $1;exit}')
kubectl cp $CILANTROPOD:/cilantro/workdirs ./workdirs_eks/ --kubeconfig ${CONFIG_PATH}
# Copy cilantro logs:
LATESTDIR=$(ls -td ./workdirs_eks/*/ | head -1)
kubectl logs $CILANTROPOD --kubeconfig ${CONFIG_PATH} > ${LATESTDIR}cilantroscheduler.log

