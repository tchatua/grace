# Configure a Database for the Service

I will begin with configuring the Postgres service in my Kubernetes cluster.

## 1. Create YAML Configurations

Before I start, I ensure that I'm connected to my K8s cluster

```sh
kubectl get namespace
```

```console
$ kubectl get storageclass
NAME            PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
gp2 (default)   kubernetes.io/aws-ebs   Delete          WaitForFirstConsumer   false                  59m
```

## 2. Apply YAML configurations

```sh
kubectl apply -f c01-postgres-database-storage.yml
```

```console
$ kubectl get pv
NAME           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
my-manual-pv   1Gi        RWO            Retain           Available           gp2            <unset>  

$ kubectl get pvc
NAME             STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
postgresql-pvc   Pending                                      gp2            <unset>                 66s
```

```sh
kubectl apply -f c02-postgres-database-workloads.yml
```

```console
$ kubectl get deploy
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
postgresql   1/1     1            1           73s

$ kubectl get rs
NAME                    DESIRED   CURRENT   READY   AGE
postgresql-6889d46b98   1         1         1       96s

$ kubectl get pod
NAME                          READY   STATUS    RESTARTS   AGE
postgresql-6889d46b98-jh4kb   1/1     Running   0          12s

$ kubectl get pvc
NAME             STATUS   VOLUME         CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
postgresql-pvc   Bound    my-manual-pv   1Gi        RWO            gp2            <unset>                 2m34s

$ kubectl get all
NAME                              READY   STATUS    RESTARTS   AGE
pod/postgresql-6889d46b98-jh4kb   1/1     Running   0          115s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   78m

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/postgresql   1/1     1            1           115s

NAME                                    DESIRED   CURRENT   READY   AGE
replicaset.apps/postgresql-6889d46b98   1         1         1       115s

```

## 3. Test Database Connection
- View the pods

```console
$ kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
postgresql-6889d46b98-jh4kb   1/1     Running   0          2m56s
```

- open bash into the pod

```console
kubectl exec -it postgresql-6889d46b98-jh4kb -- bash

```

kubectl exec -it postgresql-6889d46b98-jh4kb -- ping postgresql-6889d46b98-jh4kb

kubectl exec -it postgresql-6889d46b98-jh4kb -c postgres:latest -- /bin/bash

kubectl exec -i my-app-bfb67b899-8bh2d -- /bin/sh
