# Project Name: grace 

## Description
Cloud DevOps Engineer Workshop

## Installation
To use this project, simply clone the repository:

```bash
git clone https://github.com/tchatua/grace.git
```

## AWS CLI

- To configure the AWS CLI in my terminal
```sh
aws configure 
aws configure set aws_session_token "XXXXXXXX" 
```

- View the current configuration
```sh
aws --version
python --version
```

- To change the region in a given profile
```sh
aws configure set region us-east-2
```

- View all existing profile names
```sh
aws configure list-profiles
```

- To list all IAM users in your AWS account
```sh
aws iam list-users
# If you've multiple profiles set locally
aws iam list-users --profile <profile-name>
```

