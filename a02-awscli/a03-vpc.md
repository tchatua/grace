# Create a VPC with AWS CLI
```sh
aws ec2 create-vpc \
    --cidr-block 192.168.0.0/16 \
    --tag-specification ResourceType=vpc,Tags=[{Key=Name,Value=GraceVpc}]
```
## Viewing your VPCs using AWS CLI
```sh
aws ec2 describe-vpcs
```
