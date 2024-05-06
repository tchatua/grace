# Lambda 

## Create a Lambda Function with AWS CLI

```sh
aws lambda create-function \
    --function-name < function name> \
    --runtime nodejs14.x \
    --zip-file fileb://my-function.zip \
    --handler my-function.handler \
    --role arn:aws:iam::xxxxx:role/service-role/< function name>-role-tges6bf4
```