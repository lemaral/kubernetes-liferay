#!/bin/sh
#source kubernetes environment
. ~/kubeenv

#postgres
kubectl create -f postgres-pv.yaml
kubectl create -f postgres.yaml
sleep 10

#service
kubectl create -f liferay-data-pv.yaml
kubectl create -f liferay-deploy-pv.yaml
kubectl create -f liferay-deploy1-pv.yaml
kubectl create -f liferay-deploy2-pv.yaml
kubectl create -f liferay-deploy3-pv.yaml
kubectl create -f service.yaml
sleep 10

#nodes
kubectl create -f node1pod.yaml
sleep 10
kubectl create -f node2pod.yaml
sleep 10
kubectl create -f node3pod.yaml
sleep 10

#web
kubectl create -f web-pv.yaml
kubectl create -f web-pvc.yaml

read -n1 -r -p "Copy the certs package to the volume and Press any key to continue..." key
kubectl create -f web.yaml

#flask-watson
kubectl create -f flask-watsonlogs-pv.yaml
kubectl create -f flask-watson.yaml

#mail
kubectl create -f mail-dkim-pv.yaml
kubectl create -f mail.yaml

#persona-ranker
kubectl create -f persona-rankerlogs-pv.yaml
kubectl create -f persona-ranker.yaml
