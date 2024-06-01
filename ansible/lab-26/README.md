# Ansible Roles and Their Importance

## What are Ansible Roles?

Ansible roles are a way to organize Ansible playbooks into reusable components. Roles allow you to break down your configuration into smaller, more manageable parts. Each role is essentially a collection of tasks, variables, files, templates, and modules organized in a standardized file structure. This makes roles easy to reuse and share with others.

## Why are Ansible Roles Important?

1. **Reusability**: Roles can be reused across different projects, reducing duplication and effort.
2. **Organization**: They help in organizing playbooks by separating different concerns into their own roles.
3. **Maintainability**: Roles make it easier to maintain and update playbooks since each role is responsible for a specific part of the configuration.
4. **Collaboration**: Roles can be shared among team members or even with the wider community, promoting collaboration and best practices.
5. **Scalability**: As your infrastructure grows, roles help in scaling your configuration management by making it modular and easier to manage.

## Lab: Installing Jenkins, OpenShift CLI, and Docker on an EC2 Instance using Dynamic Inventory

### Objective

In this lab, we will create Ansible roles to install Jenkins, OpenShift CLI, and Docker on an EC2 instance using dynamic inventory.

### Prerequisites

- Ansible installed on your local machine.
- AWS CLI configured with appropriate credentials.
- EC2 instance with a suitable IAM role and security group.

### Steps

1. **Setup Dynamic Inventory**:

2. **Create Roles**:
   - Create roles for Jenkins, OpenShift CLI, and Docker.


```bash
ansible-galaxy init roles/jenkins
ansible-galaxy init roles/openshift_cli
ansible-galaxy init roles/docker
```
   
### 3. **Create Playbook**:
   - Write a playbook to use these roles and deploy the necessary software.

#### 4. Run the Playbook

Run the playbook using the dynamic inventory.

The following images demonstrate the playbook run for deploying Jenkins, Docker, and OpenShift CLI.

![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-26/Pictures/ansible-docker.png)
![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-26/Pictures/ansible-jenkins.png)
![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-26/Pictures/ansible-oc.png)

Run the following command to execute the playbook:

```bash
ansible-playbook -i inventory/ec2.py site.yml
```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-26/Pictures/verify-installation.png)
      


