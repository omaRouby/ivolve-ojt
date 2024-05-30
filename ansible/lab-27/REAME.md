# Ansible Dynamic Inventory for AWS EC2 Instances

This project demonstrates how to use Ansible with a dynamic inventory to manage AWS EC2 instances. We have created two playbooks: one to ping the EC2 instances and another to create a file on the instances. Below are the steps and explanations for the process.

## Prerequisites

- Ansible installed on your local machine.
- AWS CLI configured with appropriate permissions.
- EC2 instances running on AWS.

## Steps

1. **Setup Ansible Dynamic Inventory**

   Ansible dynamic inventory script for AWS EC2 instances is configured. This allows Ansible to automatically fetch the list of EC2 instances from AWS.

2. **Playbook to Ping EC2 Instances**

   We created a playbook `ping.yml` to ping the EC2 instances and verify connectivity.

3. **Playbook to Touch a File on EC2 Instances**

   Another playbook `touchfile.yml` was created to touch a file (`/tmp/ansible_touchfile.txt`) on the EC2 instances.

## Running the Playbooks

1. **Run the Ping Playbook**

   Execute the following command to run the ping playbook and verify connectivity to the EC2 instances:
   ```sh
     ansible-playbook -i inventory.aws_ec2.yml ping_ec2.yml
   ```
   ![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-27/pictures/playbook-ping-run.png)
2. **Run the Touch file Playbook**
     Execute the following command to run the playbook that touches a file on the EC2 instances:
    ```sh
    ansible-playbook -i inventory.aws_ec2.yml touch-file.yml
    ```
    ![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-27/pictures/playbook-touchfile-run.png)
3. **Verify the File Creation**
     Connect to the EC2 instances and verify that the file has been created:
   ![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-27/pictures/verify-touched-file-console.png)

## Conclusion
This setup demonstrates how to use Ansible with a dynamic inventory to manage AWS EC2 instances. 
The two playbooks show basic operations: pinging instances and creating files, which can be extended for more complex automation tasks.
   
