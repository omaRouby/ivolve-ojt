# Deploying a Multi-Tier Architecture with Terraform

This guide explains how to deploy a multi-tier architecture on AWS using Terraform without using modules. The deployment includes setting up a VPC, subnets, EC2 instances, and an RDS database.

## Prerequisites

- Terraform installed on your local machine.
- AWS CLI configured with appropriate permissions.
- Basic knowledge of Terraform and AWS resources.

## Steps

### 1. Initialize Terraform Project

Create a new directory for your Terraform project, navigate to it, and initialize the project using `terraform init`.

### 2. Define the VPC

In your `main.tf` file, define a Virtual Private Cloud (VPC) to isolate your infrastructure within a private network.

### 3. Define Subnets

Add public and private subnets within the VPC to host your resources. Public subnets will be used for resources that need internet access, while private subnets will host internal resources.

### 4. Create an Internet Gateway

Set up an internet gateway to enable internet access for resources in the public subnets.

### 5. Define Route Tables

Create and associate route tables with your subnets. The public subnet's route table will direct internet-bound traffic to the internet gateway, while the private subnet's route table will direct traffic through a NAT gateway.


### 6. Launch EC2 Instances

Define and launch EC2 instances in both public and private subnets. The instances in the public subnet can serve as web servers, while those in the private subnet can serve as application servers.




### 10. Output Useful Information

Configure Terraform to output useful information such as the public IP addresses of EC2 instances, the DNS endpoint of the RDS database, and any other relevant details.

### 11. Apply the Configuration

Run `terraform apply` to create the infrastructure defined in your configuration files. Review the changes Terraform will make and confirm to proceed.

### 12. Verify the Deployment

Once Terraform has applied the configuration, verify the deployment by accessing the EC2 instances and the RDS database. Ensure that the instances in the public subnet are accessible via the internet and that the private instances and database can communicate with each other.

## Verification Images

### VPC Created

The VPC is successfully created and configured.
![VPC Created](vpc-created.png)

### Internet Gateway Created

The internet gateway is successfully created and attached to the VPC.
![Internet Gateway Created](igw-created.png)


### RDS Database Created

The RDS instance has been successfully provisioned in the private subnet.
![RDS Database Created](https://github.com/omaRouby/ivolve-ojt/blob/main/terraform/lab24/pictures/db-created.png)

### Terraform Apply Screenshot

Screenshot of the Terraform apply process showing the successful creation of resources.
![Terraform Apply Screenshot](https://github.com/omaRouby/ivolve-ojt/blob/main/terraform/lab24/pictures/apply%20screenshot.png)

## Conclusion

This setup demonstrates how to deploy a multi-tier architecture on AWS using Terraform without using modules. By defining VPC, subnets, EC2 instances, and an RDS database in a single configuration file, you can create a scalable and secure infrastructure for your applications.

