#!/bin/bash

kubectl delete statefulset es-cluster -n efk
kubectl delete pvc data-es-cluster-0 -n efk 
kubectl delete pvc data-es-cluster-1 -n efk 
kubectl delete pvc data-es-cluster-2 -n efk 
kubectl delete pv elasticsearch-pv -n efk
kubectl delete pv elasticsearch-pv2 -n efk
kubectl delete pv elasticsearch-pv3 -n efk
kubectl delete svc elasticsearch -n efk

kubectl delete svc kibana -n efk
kubectl delete deployment kibana -n efk

kubectl delete deployment fluent-bit -n efk
kubectl delete pv logs-pvc -n efk
kubectl delete pvc logs-pvc -n efk
kubectl delete configmap fluent-bit-config -n efk
kubectl delete ClusterRole fluent-bit-read
kubectl delete ClusterRoleBinding fluent-bit-read
kubectl delete ServiceAccount fluent-bit -n efk