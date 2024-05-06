# Amazon S3 Bucket

- To create an S3 bucket 

```bash
aws s3api create-bucket --bucket YOUR_BUCKET_NAME --region YOUR_REGION
aws s3api create-bucket --bucket grace-bucket-050320240410 --region us-east-1
```

- To delete an S3 bucket using the AWS Command Line Interface (AWS CLI)

```bash 
aws s3api delete-bucket --bucket MY_BUCKET_NAME
aws s3api delete-bucket --bucket MY_BUCKET_NAME
```

- If the bucket contains any objects, you will need to delete them first

```bash
aws s3 rm s3://MY_BUCKET_NAME --recursive
```
