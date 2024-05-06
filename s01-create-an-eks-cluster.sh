#!/bin/bash 
echo -e "\n\nCreate a cluster with eksctl"
sleep 4
eksctl create cluster --name grace-cluster --region us-east-1 --nodegroup-name grace-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2
if [$? != 0 ]
then 
    echo -e "\n\nKubernetes is not installed successfully"
    exit
else
    echo -e "\n\nKubernetes is installed successfully"
fi 
# -------------------------------------------------------------------
echo -e "\n\nupdating the context in the local Kubeconfig file"
sleep 4
aws eks --region us-east-1 update-kubeconfig --name grace-cluster
if [$? != 0]
then
    echo -e "\n\nThe local kubeconfig file is not updated successfully." 
    echo -e "\nLet's make some investigation and sole the problem by your own."
    exit
else
    echo -e "\n\nThe local kubeconfig file is updated successfully." 
fi

