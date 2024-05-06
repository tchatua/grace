# Lambda Functions with Triggers

- In this lab, I will **write a Lambda function using Node.js that is triggered by an item being added to my S3 storage**.
- By the end of this exercise, you will be able to:
    - **Create an S3 bucket**
    - **Author a Lambda function using Node.js via the console**
    - **Create a Trigger and an associated test event**.
    - **Test a Lambda function via the console when a file is added to your S3 bucket**

## Step 0. Prerequisite: Create an S3 bucket
AWS S3 is a file storage service

- Go to the S3 dashboard, and click on the **Create bucket**.
- Bucket type
- choose a region: *us-east-1*
- Enter the bucket name: *grace-bucket-050420242437-for-lambda-test*
  - The name should be unique worldwide, 
  - I can use the convention as **my-<aws account id>-bucket** or **projectName-bucket-groupDateHour-goals**. 
- Object ownership: *default value by leaving "ACLs disabled"*
- and make it visible to the public: *Uncheck "Block all public access"* and make the bucket publicly accessible
- *Leave other fields as default*, and **create bucket**.
- Moving forward, search and select the lambda function

## Step 1. Create a Lambda Function
- From the **AWS Management Console** page, select the **Lambda** service.
- Use the **Create function** wizard, 
- Select the **Author from scratch** option.
- Use the following **Basic information** to create a function:
**Field**	        **Value**
Function name	    myGracelambdaFunctionAGT
Runtime	            *Node.js 14.x*
Architecture:       x86_64
Permissions	        Use default
- Click **Create function**
- By default, Lambda will create an execution role with permissions to upload logs to Amazon CloudWatch Logs.
- On the lambda function page, click **Configuration** 

## Step 2: Add a Trigger
The wizard will automatically display the details of the newly created function. 
Add a trigger under the Designer section
  - Click Add Trigger 
  - On the Add Trigger screen, select **S3** as the trigger
  - Select the S3 bucket name for the Bucket: *grace_bucket_050420242437_for_lambda_test*
  - For Event Type, select *All object create events*. 
    - **This means that anytime a file is created (or uploaded) to the selected S3 bucket, the lambda function will be triggered**.
  - Acknowledge the Recursive invocation message 
  - Click the **Add** button. ***Congratulations, I’ve added a trigger!***

In the Designer section, click on the name of the Lambda to have the Function Code section reappear

## Step 3. Configure Test event
Next, the wizard will automatically display the details of the newly created function.
- Click on the **Test** button to configure test event(s).
- For the **Event name** enter *TestEventGraceAGT*.
- Ensure the **Event template** is **Hello World**.
- Update the JSON to the statement below, replacing the string value with your name.

```json
"key1": "Arristide Tchatua"
"key2": "value2"
"key3": "value3"
```
- Go to the **Code* tab:

## Step 4. Modify a Lambda Function
- Go to the **Function code** section, where you can view the following default JS code: and *modify the body statement*

```json
exports.handler = async (event) => {
// TODO implement
const response = {
  statusCode: 200,
  body: JSON.stringify('Hello' + event.key1 + 'from Lambda!'),
};
return response;
};
```

- Replace the code on Line 5 with the statement below, and save your code:

```json
body: JSON.stringify('Hello ' + event.key1 + ' from Lambda!'),
```

- Deploy your saved function by clicking on the **Deploy** button
- Edit the **Basic Settings** section, save the following values, and leave other fields as default:
- Make sure the **Execution role** field uses an existing role.

## Step 5. Test a Lambda Function
- Click the **Test** button  to test my function.
- The output will be displayed in the **Execution results** section . 
- Expand the Details to review the output.

## Step 6. Add files to the bucket
- Adding files to the S3 bucket should trigger my Lambda function
- From the **S3 dashboard**, click on the name of the bucket you have created in the first step above.
- Upload a few files to the bucket, from my local computer.

## Step 7. Check if the Lambda function is triggered
- Go back to the Lambda console, and select my function to view its details.
- Click on the Monitoring tab to view the metrics that show the number of times the Lambda function is triggered as a response to file(s) upload in the S3 bucket.
- I can view the detailed **Invocations** chart in the CloudWatch console.
- The detailed graph in the CloudWatch console shows that the Lambda function was triggered three times.
    - CloudWatch metrics showing the number of invocations of the Lambda function. Recall that anytime a file is created (or uploaded) to the selected S3 bucket, the lambda will be triggered .

## Step 8. Delete resources
- Delete the Lambda function, and the S3 bucket. Empty the bucket befeore deleting it
