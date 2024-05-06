## EC2

## How To Create EBS Volume with AWS CLI
```sh
aws ec2 create-volume 
--availability-zone < zone value goes here>
--size < value goes here>
--tag-specifications 'ResourceType=string,Tags=[{Key=string,Value=string},{Key=string,Value=string}]'
```
## List Volumes using AWS CLI
```sh
aws ec2 describe-volumes \
-- filters Name=tag:Name,Values=Test* \
-- query "Volumes[*].{ID:VolumeId,Tag:Tags}" 
```


