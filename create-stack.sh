#!/bin/bash

#helm repo add prometheus-community https://github.io

helm repo update

kubectl create namespace monitoring

helm install k-prom-black prometheus-community/prometheus-blackbox-exporter --namespace monitoring -f blackbox-values.yaml

helm upgrade --install k-prom-black prometheus-community/prometheus-blackbox-exporter -n monitoring -f blackbox-values.yaml

helm install k-prom-stack prometheus-community/kube-prometheus-stack --namespace monitoring -f kube-prometheus-values.yaml

helm upgrade --install k-prom-stack prometheus-community/kube-prometheus-stack -n monitoring -f kube-prometheus-values.yaml

kubectl apply -f google-probe.yaml

kubectl port-forward svc/k-prom-stack-grafana 3000:80 -n monitoring

