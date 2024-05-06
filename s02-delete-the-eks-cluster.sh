#!/bin/bash 

# eksctl create cluster --name grace-cluster --region us-east-1 --nodegroup-name grace-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2

eksctl delete cluster --name grace-cluster --region us-east-1
