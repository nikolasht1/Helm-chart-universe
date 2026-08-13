helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create ns monitoring
kubectl get namespaces -A
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  -f universe-values.yaml --namespace monitoring --create-namespace