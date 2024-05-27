
# AWS Project Documentation

This project involves setting up an AWS environment with specific IAM configurations, billing alarms, and creating 2 IAM groups (admin-developer), admin group has admin permissions, developer group only access to s3, create admin-1 user console access only with MFA & admin-2 user with cli access only and list all users and groups using commands,  Below are the steps taken and screenshots documenting each part of the process.

## Project Steps

1. **Create AWS Account**
   - Set up a new AWS account for the project.

2. **Set Billing Alarm**
   - Configure billing alarms to monitor and control AWS spending.
   - ![Billing Alarm](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-19/pictures/billing%20alarm.png)
   - ![Alert Preferences](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-19/pictures/alert%20prefrences.png)
   - ![CloudWatch Billing Alert](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-19/pictures/cloud%20watch%20billin%20alert.png)
   - ![CloudWatch Alarm](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-19/pictures/cloudwatch-alarm.png)

3. **Create IAM Groups**
   - Create two IAM groups: `admin` and `developer`.
     - `admin` group has administrative permissions.
     - `developer` group has access to S3 only.

4. **Create IAM Users**
   - Create users with specific access controls:
     - `admin-1` user with console access only and MFA enabled.
     - `admin-2` user with CLI access only.
     - `dev-user` with programmatic and console access.
   - **Access Denied for EC2:**
   - dev user trying to navigate to EC2 and instances but permission denied due to the attached group polices
     - ![Access Denied for EC2](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-19/pictures/acces%20denied%20for%20ec2.png)
   - **Access Allowed to S3:**
   - dev user trying to navigate to S3 buckets but and he success due to the attached group polices
     - ![Access Allowed to S3](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-19/pictures/access%20allowed%20to%20s3.png)

5. **List Users and Groups**
   signin into the cli using admin-2 public and private keys ypu generated
   - admin-2 user Lists all IAM users and groups using AWS CLI commands.
   - ![List Users and Groups from CLI](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-19/pictures/list%20users%20and%20groupps%20from%20cli.png)
