helm repo add prometheus-community https://github.io
helm repo update
kubectl create namespace monitoring
helm install prometheus-blackbox-exporter prometheus-community/prometheus-blackbox-exporter \
  --namespace monitoring \
  -f blackbox-values.yaml
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  -f kube-prometheus-stack-values.yaml
kubectl apply -f google-probe.yaml

