
# AWS Project Documentation

This project involves creating a private subnet, launching EC2 instances, configuring security groups, and connecting to the instance using a bastion host.

## Steps

### 1. Create VPC and Subnets
- Create a VPC and configure both public and private subnets.
  ![VPC and Subnets Creation](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-20/pictures/VPC%26subnets-creation.png)
  
### 2. View Your VPC
- Verify the VPC configuration.
  ![My VPC](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-20/pictures/my-VPC.png)

### 3. Configure Security Groups
- Set up security groups for the instances.
  ![Security Group Configuration](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-20/pictures/SG-priv-subnet.png)
  ![Security Group Inbound Rules](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-20/pictures/securtyGroup-inbounRules.png)

### 4. Launch EC2 Instances
- Launch an EC2 instance in the private subnet.
  ![Private EC2 Instance](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-20/pictures/priv-EC2.png)
- Launch an EC2 instance in the public subnet (bastion host).
  ![Public EC2 Instance](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-20/pictures/pub-EC2.png)

### 5. SSH into EC2
- Connect to the private EC2 instance using the bastion host.
  ![SSH into EC2](https://github.com/omaRouby/ivolve-ojt/blob/main/aws/lab-20/pictures/SSH-EC2.png)
