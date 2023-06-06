#!/bin/bash

cd elasticsearch
kubectl apply -f pv.yaml
kubectl apply -f es-sts.yaml
kubectl apply -f es-svc.yaml 

cd ../kibana
kubectl apply -f kibana-deployment.yaml
kubectl apply -f kibana-svc.yaml

cd ../fluentbit
kubectl apply -f fluent-bit-role.yaml
kubectl apply -f fluentbit-configmap.yaml
kubectl apply -f  fluentbit-deployment.yaml 
