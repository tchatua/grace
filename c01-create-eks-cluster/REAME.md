# Create an EKS Cluster

## Check IAM Permission
```console
$ aws sts get-caller-identity
{
    "UserId": "xxxxxxxxxxxxxxx",
    "Account": "xxxxxxxxxxxxxx",
    "Arn": "arn:aws:iam::xxxxxxxxxxxx:user/tandjara"
}

$ aws iam list-users
{
    "Users": [
        {
            "Path": "/",
            "UserName": "tandjara",
            "UserId": "xxxxxxxxxxxxxxxx",
            "Arn": "arn:aws:iam::xxxxxxxxxxxx:user/tandjara",
            "CreateDate": "2023-06-22T17:52:26+00:00"
        }
    ]
}
```
- I have the necessary IAM permissions to create a cluster

## Create an EKS Cluster

### Install **eksctl** and use it to create an EKS cluster. 
- eksctl is available to install from official releases as described below. 
- We recommend that you install eksctl from only the official GitHub releases. 
- You may opt to use a third-party installer, but please be advised that AWS does not maintain nor support these methods of installation. 
- Use them at your own discretion.
- URL: https://eksctl.io/installation/
```sh
choco install eksctl
```sh 

```console
$ eksctl version
0.176.0
```
#### Prerequisites
- I will need to have AWS API credentials configured. 
- What works for AWS CLI or any other tools (kops, Terraform, etc.) should be sufficient. 
- I can use **~/.aws/credentials** file or environment variables. 
- For more information read AWS documentation.

- Here is a quick start guide for **creating EKS cluster using the eksctl cli tool**. 
- It's as simple as running a single command to create a cluster:

```sh
eksctl create cluster --name grace-cluster --region us-east-1 --nodegroup-name grace-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2
```

## Update the Kubeconfig
- After creating an EKS cluster, execute the command below to update the context in the local Kubeconfig file.
- This file allows configuring access to clusters, and should have at least one active context. 
- It contains the information about **clusters**, **users**, **namespaces**, and **authentication mechanisms**.
```sh
aws eks --region us-east-1 update-kubeconfig --name grace-cluster
```

- Verify and copy the context name
```sh
kubectl config current-context
```

- Alternatively, view the entire Kubeconfig file.

```sh
kubectl config view
```
### NB:
- If your **kubeconfig** file is blank or unavailable, I may not be able to interact with any of your clusters. 
- In general, when I install **kubectl** and create a local Kubernetes cluster, kubectl utility automatically sets the **kubeconfig** file.

## Delete the EKS Cluster
When I finish my demo project, I use the following command to delete my EKS cluster

```sh
eksctl delete cluster --name grace-cluster --region us-east-1
```
