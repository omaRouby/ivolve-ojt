# Ansible Playbook with Ansible Vault for MySQL Setup

This README file explains how to use Ansible to install MySQL, create a `db-admin` user, and grant privileges using Ansible Vault to encrypt sensitive information like database and user passwords.

## Prerequisites

Before using the playbook, ensure the following:

- **SSH Enabled**: Make sure SSH is enabled on your system.
- **Allow SSH Traffic**: Allow SSH traffic on your firewall.
- **Ansible Installed**: Ensure Ansible is installed on your control machine.
- **MySQL Installed**: Ensure MySQL is not already installed on the target machines.

## Verify the DB is created and db-admin user could create tables 
![](https://github.com/omaRouby/ivolve-ojt/blob/main/ansible/lab-3/Database-Check.png)
