#!/bin/bash

helm uninstall k-prom-stack -n monitoring

helm uninstall k-prom-black -n monitoring

kubectl delete ns monitoring
