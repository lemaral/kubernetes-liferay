#!/bin/sh
#source kubeenv
. ~/kubeenv

#delete postgres
kubectl delete deployment postgres
kubectl delete service postgres
kubectl delete pvc liferay-postgress
kubectl delete pv liferay-postgress

#delete nodes
kubectl delete pods node1
kubectl delete pods node2
kubectl delete pods node3
kubectl delete service node1
kubectl delete service node1public
kubectl delete service node2
kubectl delete service node3

#delete service
kubectl delete deployment service
kubectl delete service service
kubectl delete pvc liferay-deploy3
kubectl delete pvc liferay-deploy2
kubectl delete pvc liferay-deploy1
kubectl delete pvc liferay-deploy
kubectl delete pvc liferay-data
kubectl delete pv liferay-deploy3
kubectl delete pv liferay-deploy2
kubectl delete pv liferay-deploy1
kubectl delete pv liferay-deploy
kubectl delete pv liferay-data

#delete web
kubectl delete deployment web
kubectl delete service web
#kubectl delete pvc web-claim0
#kubectl delete pv web

#delete flask-watson
kubectl delete deployment flask-watson
kubectl delete service flask-watson
kubectl delete pvc flask-watson-logs
kubectl delete pv flask-watsonlogs

#delete mail
kubectl delete deployment mail
kubectl delete service mail
kubectl delete pvc liferay-mail-dkim
kubectl delete pv mail-dkim

#delete persona-ranker
kubectl delete deployment persona-ranker
kubectl delete service persona-ranker
kubectl delete pvc persona-ranker-logs
kubectl delete pv persona-rankerlogs
