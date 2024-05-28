# AWS VPC, EC2 Instances, and Load Balancer Configuration

This project demonstrates how to create a VPC with two subnets, launch two EC2 instances with Nginx and Apache installed, and configure an Application Load Balancer (ALB) to access the web servers.

## Prerequisites

- An AWS account with necessary permissions to manage VPC, EC2, and ALB.
- Basic understanding of AWS services and networking concepts.

## Steps

### 1. Create a VPC with 2 Subnets

1. Navigate to the VPC service in the AWS Management Console.
2. Click on **Create VPC**.
3. Enter the required details for the VPC, including the CIDR block.
4. Create two subnets within the VPC, one in each availability zone.

### 2. Launch EC2 Instances with Nginx and Apache

1. Navigate to the EC2 service in the AWS Management Console.
2. Click on **Launch Instance** and configure the instance details.
3. Select an Amazon Machine Image (AMI) and instance type.
4. Configure the instance details, ensuring to place one instance in each subnet.
5. Add the following user data script to install Apache on the first EC2 instance:
   ```bash
   #!/bin/bash
   yum update -y
   yum install -y httpd
   systemctl start httpd
   systemctl enable httpd
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-21/pictures/attachEC2-script-install-apache.png)
6. Launch the instance.
7. Repeat the process for the second instance but now connect to install nginx 
![](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-21/pictures/connectToInstall.nginx.png)

### 3. Create a Security Group for the ALB

- Navigate to the EC2 service and click on **Security Groups**.
- Create a new security group and allow HTTP traffic (port 80).
  - ![Create Security Group for ALB to Allow HTTP](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-21/pictures/create-SGforALB-allow-http.png)

### 4. Create and Configure an Application Load Balancer

- Navigate to the EC2 service and click on **Load Balancers**.
- Click on **Create Load Balancer** and select **Application Load Balancer**.
- Enter the load balancer details and select the VPC and subnets created earlier.
- Configure the security group created for the ALB.
- Create a target group and register the EC2 instances.
  - ![Create Target Group for Nginx and Apache EC2](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-21/pictures/create-targetGroup-nginx%26apacheEC2.png)
![](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-21/pictures/select-targets.png)

### 5. Test the Setup

- Access the load balancer's DNS name in a web browser to verify that the traffic is routed to the web servers.
  - ![](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-21/pictures/loaded-apache-page.png)
  - ![](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-21/pictures/loaded-nginx-page.png)
    
  
## Conclusion
You have now created a VPC with two subnets, 
launched two EC2 instances with Nginx and Apache installed, and configured an Application Load Balancer to distribute 
traffic between the web servers.
This README covers the steps to set up and test the environmen
