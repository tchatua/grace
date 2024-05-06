# Use Elastic Beanstalk to deploy a web application on the cloud

## Step 1. Access Elastic Beanstalk service from AWS Management Console
- Use the **Create Application** wizard to create an application with the following configuration details:
- It will create an environment for a sample application to run. SELECT **web server environment**
  - Create a web app
    - applicaltion information
      - Application name: *grace-beanstalk-app*
    - Platform:
      - platform: *Tomcat*
      - Platform branch: *Tomcat 8.5 with Corretto 11 running on 64 bit Amazon Linux 2*
      - Platform version: *4.4.4(Recommended)*
    - Application code
      - SELECT *Sample application*
- Service access:
  - service role: **use an existing service role** or **create and use new service role**: *aws-elasticbeanstalk-service-role*
- **NB*: It will take about 10 minutes for your application, and its environment to be created.

## Important
- Observe the logs shown on your dashboard to understand the resources that are spun up to support your application. 
- While launching the environment and deploying EC2 instances to run your application, the following resources get created automatically:
    - Amazon S3 storage bucket
    - A target group in the default VPC
    - Multiple security groups
    - An autoscaling launch configuration and an autoscaling group
    - Multiple EC2 instances
    - Multiple CloudWatch alarms
    - EC2 load balancer You can even see the logs of each event (success and failure) after the creation of the environment. Check the event info.

- I can change the log-level to see more detailed information. The standard log-levels in any application are trace, debug, info, warn, error, and fatal.
- My application is created once I see a green checkmark and the Health of your application as Ok.
- After the application is deployed successfully, copy the application’s URL
- Congratulations! You've deployed a sample application and spun up automatically.

## Step 2. Inspect the resources created for you
- Navigate to the EC2 console and *inspect the instance* that was created for me. 
- The instance has the *same name as my application*. 
- I can administer and manage this EC2 as if I created it yourself.
- On the same EC2 dashboard, select the **Security groups** service to view the security groups (**firewall rules**) that got created automatically.
- I can also navigate to the *Amazon S3 service* to view the S3 buckets created for the web application. 
- All these resources are managed by the Elastic Beanstalk service.

## Step 3. Cleanup and delete resources
I must delete your AWS resources:
- Go to the Elastic Beankstalk Applications dashboard to delete your application components.
- navigate back to the Elastic Beankstalk's Environments dashboard  to terminate my environment 
- Delete S3 buckets


