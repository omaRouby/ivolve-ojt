# Serverless Application with AWS Lambda, API Gateway, and DynamoDB

This project demonstrates how to build a serverless application using AWS Lambda, API Gateway, and DynamoDB. Below are the detailed steps followed in the AWS Management Console to create the application.

## Prerequisites

- An AWS account with necessary permissions to create and manage Lambda, API Gateway, and DynamoDB.
- Basic understanding of AWS services and serverless architecture.

## Steps

### 1. Create a DynamoDB Table

1. Navigate to the DynamoDB service.
2. Click on **Create table**.
3. Enter the table name and primary key as required.
   - ![Create DynamoDB Table](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/createTable.png)
4. Configure other settings as needed and click **Create**.
   - ![DynamoDB Table Created](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/createTable.png)

### 2. Create an IAM Role for Lambda to Access DynamoDB

1. Navigate to the IAM service.
2. Create a new role with DynamoDB full access policy.
   - ![IAM Role Access to DynamoDB](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/IamRoleAccesDdb.png)

### 3. Create a Lambda Function

1. Navigate to the Lambda service.
2. Click on **Create function**.
3. Choose the option to Author from scratch.
4. Enter the function name, runtime (e.g., Python 3.x), and the role created in the previous step.
5. Click **Create function**.
6. Upload the Lambda code (provided in the repository) to the function.
   - ![Lambda Function Overview](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/function-overview.png)
   - ![Uploaded Lambda Code](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/uploaded-lambdaCode.png)

### 4. Create a REST API in API Gateway

1. Navigate to the API Gateway service.
2. Click on **Create API**.
3. Select REST API and click **Build**.
   - ![Create REST API](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/create-restAPI.png)
4. Enter the API name and other details.
   - ![New API](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/new-api.png)

### 5. Create Methods for the API

#### Create POST Method

1. Select the created API and navigate to **Resources**.
2. Click on **Actions** and then **Create Method**.
3. Select POST from the dropdown and click the checkmark.
   - ![Create POST Method](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/create-post-method.png)   
4. Set up the POST method to integrate with Lambda.
   - ![API Method Execution](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/api-method-execution.png)

#### Create GET Method

1. Repeat the steps to create another method, but select GET this time.
   - ![Create GET Method](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/create-get-method.png)
2. Configure the GET method to retrieve data from DynamoDB through Lambda.

### 6. Deploy the API

1. Navigate to the **Stages** section in API Gateway.
2. Create a new stage and deploy the API.
   - ![API Page](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/api-page.png)

### 7. Test the API

1. Use tools like Postman or Curl to test the POST and GET methods.
2. Add data to the DynamoDB table via the POST method and retrieve it using the GET method.
   - ![Thanks for Data](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/api-thanksForData.png)
   - ![Table After Data Added](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-23/pictures/tabelAfterData-added.png)

## Lambda Code

```python
import json
import os
import boto3

def lambda_handler(event, context):
    try:
        mypage = page_router(event['httpMethod'], event['queryStringParameters'], event['body'])
        return mypage
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }

def page_router(httpmethod, querystring, formbody):
    if httpmethod == 'GET':
        try:
            with open('contactus.html', 'r') as htmlFile:
                htmlContent = htmlFile.read()
            return {
                'statusCode': 200,
                'headers': {"Content-Type": "text/html"},
                'body': htmlContent
            }
        except Exception as e:
            return {
                'statusCode': 500,
                'body': json.dumps({'error': str(e)})
            }

    elif httpmethod == 'POST':
        try:
            insert_record(formbody)
            with open('success.html', 'r') as htmlFile:
                htmlContent = htmlFile.read()
            return {
                'statusCode': 200,
                'headers': {"Content-Type": "text/html"},
                'body': htmlContent
            }
        except Exception as e:
            return {
                'statusCode': 500,
                'body': json.dumps({'error': str(e)})
            }

def insert_record(formbody):
    formbody = formbody.replace("=", "' : '")
    formbody = formbody.replace("&", "', '")
    formbody = "INSERT INTO ivolvetable  value {'" + formbody + "'}"

    client = boto3.client('dynamodb')
    response = client.execute_statement(Statement=formbody)
    # Assuming the execute_statement call returns successfully
    return response

