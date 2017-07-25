Contents:
--------
1. ReadME.txt - This file
2. postgres-pv.yaml - This creates the persistence volume on NFS share
3. postgres.yaml - This creates the deployment postgres along with the service which exposes port 5432 to other pods

4. web-pv.yam - This creates a persistance volume on NFS share.
5. web-pvc.yaml - This creates persistance volume claim using the persistence volume created above
6. web.yaml - This creates the web deployment which creates the required services also openign ports 80 and 443.

7. liferay-data-pv.yaml - This creates the persistent volume used by service and nodes
8. liferay-deploy-pv.yaml - This creates the persistent volume used by service and nodes
9. liferay-deploy1-pv.yaml - This creates the persistent volume used by service and nodes
10. liferay-deploy2-pv.yaml - This creates the persistent volume used by service and nodes
11. liferay-deploy3-pv.yaml - This creates the persistent volume used by service and nodes

12. service.yaml - This creates the service deployment

13. node1pod.yaml - This file creates the node1 pod along with the required services
14. node2pod.yaml - This file creates the node2 pod along with the required services
15. node3pod.yaml - This file creates the node3 pod along with the required services

16. mail-dkim-pv.yaml - This file creates a peristent volume on NFS share
17. mail.yaml - This file creates the mail deployment

18. flask-watsonlogs-pv.yaml - This file creates a persistent volume on NFS share 
19. flask-watson.yaml - This file creates the flask-watson deployment

20. persona-rankerlogs-pv.yaml - This file creates a persistent volume on NFS share 
21. persona-ranker.yaml - This file creates the persona-ranker deployment
22. createapp.sh ( runs each and every yaml file in an order )
23. deleteapp.sh ( deletes the volumes, services, deployments and pods )

Procedure:
---------
The following prerequisites need to be satisfied

Prerequiites:

1. kubectl commandline is available in the workstation
2. Environment variables along with the security token for the target Kubernetes environment is sourced
3. NFS storage is available. In case of bluemix, use file storage or endurance storage
4. docker registry login in details

Persistent Storage:

For persistent storage, filestorage can be used. It is NFS based. To use with NFS, the storage needs should be accessible from the Kubernetes Cluster nodes.

Example:
    - For example if the NFS mount is aa.bb.cc.dd:/mydir
    - First create a directory, say aa.bb.cc.dd:/mydir/myvol1
    - Create a Persistent Volume yaml
    - Sample file
         apiVersion: v1
         kind: PersistentVolume
         metadata:
           name: myvol1
           labels:
             assign-to: myvol1
         spec:
           capacity:
             storage: 1Gi
           accessModes:
             - ReadWriteOnce
           persistentVolumeReclaimPolicy: Recycle
           nfs:
             path: /mydir/myvol1
             server: aa.bb.cc.dd
    - kubectl create -f <filename for persistent volume> 
    Note: if the directory myvol1 is not created, the volume cannot be mounted on the container. It throws error

Create secrets:

As the container images are in the private docker registry, have to create a registry with the name cerebri-registry using the syntax
kubectl create secret docker-registry cerebri-registry --docker-server=https://index.docker.io/v1/ --docker-username=<userid> --docker-password=<password> --docker-email=<email id>

Deploy the application:

1. Create a directory liferay-postgress on NFS share
2. kubectl create -f postgres-pv.yaml
3. kubectl create -f postgres.yaml
4. Create directories liferay-data, liferay-deploy, liferay-deploy1, liferay-deploy2, liferay-deploy3 on NFS share
5. kubectl create -f liferay-data-pv.yaml
6. kubectl create -f liferay-deploy-pv.yaml
7. kubectl create -f liferay-deploy-pv1.yaml
8. kubectl create -f liferay-deploy-pv2.yaml
9. kubectl create -f liferay-deploy-pv3.yaml
10. kubectl create -f service.yaml
11. kubectl create -f node1pod.yaml
12. kubectl create -f node2pod.yaml
13. kubectl create -f node3pod.yaml
14. Create a directory web on NFS share 
15. kubectl create -f web-pv.yaml
16. kubectl create -f web-pvc.yaml
17. Copy the certificates to this volume, so that web service can use the certificate
18. kubectl create -f web.yaml
19. Create diectory flask-watsonlogs on NFS share
20. kubectl create -f flask-watsonlogs-pv.yaml
21. kubectl create -f flask-watson.yaml
22. Create diectory mail-dkim on NFS share
23. kubectl create -f mail-dkim-pv.yaml
24. Create directory persona-rankerlogs on NFS share
25. kubectl create -f persona-rankerlogs-pv.yaml
26. kubectl create -f persona-ranker.yaml 

