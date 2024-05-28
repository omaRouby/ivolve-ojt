# AWS S3 Bucket Management with AWS CLI

This project demonstrates how to manage an S3 bucket using the AWS CLI. The steps include creating an S3 bucket, configuring permissions, uploading and downloading files, enabling versioning, and setting up logging.

## Prerequisites

- An AWS account with necessary permissions to manage S3 buckets.
- AWS CLI installed and configured on your local machine.
- Basic understanding of AWS services and the AWS CLI.

## Steps

### 1. Create an S3 Bucket Using the AWS CLI

1. Open your terminal.
2. Use the AWS CLI to create an S3 bucket.
   - ![Create Bucket Using CLI](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/create%20bucket%20using%20cli.png)
3. Verify the bucket creation in the AWS Management Console.
   - ![Check Bucket Created in Console](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/check%20bucket%20created%20from%20console.png)

### 2. Configure Permissions for the Bucket

1. Set the appropriate bucket policies or ACLs as needed to configure permissions.

### 3. Upload Files to the S3 Bucket

1. Use the AWS CLI to upload a file to the bucket.
   - ![Upload File Using CLI](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/upload.png)
2. Verify the upload in the AWS Management Console.
   - ![Check Uploaded File in Console](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/check%20uploaded%20file%20console.png)

### 4. Download Files from the S3 Bucket

1. Use the AWS CLI to download a file from the bucket.
```bash
   
aws s3 cp s3://my-bycket-ivolve/ivolve-script s3-download/
```
2. Ceck if the file is downloaded
![](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/downloaded-file.png)

### 5. Enable Versioning and Logging for the Bucket

1. Enable versioning for the bucket.
   - ![Enable Versioning and Logging](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/enable%20versioning%20and%20logging.png)
   - ![Versioning Enabled](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/enable%20versioning%20and%20logging.png)
2. Verify versioning in the AWS Management Console.
   - ![Check Versioning Created in Console](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/check%20versioning%20created%20console.png)

3. Enable server access logging for the bucket.
4. Create anothe bucket to log into
```bash
   aws s3api create-bucket --bucket my-bycket-ivolve-logs --region us-east-1

```
   - ![Put Logging in Log Bucket Using CLI](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/put%20logging%20in%20log%20bucket%20cli.png)
6. Verify logging in the AWS Management Console.
   - ![Check Logging Created in Console](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-22/pictures/check%20logging%20created%20in%20console.png)


## Conclusion

You have now created and managed an S3 bucket using the AWS CLI. This README covers the steps to create a bucket, configure permissions, upload/download files, enable versioning, and set up logging.

