# Disk Space Alert Script

This script is designed to monitor disk space usage on your system and send email alerts when the usage exceeds a specified threshold. Below are the steps to set up and configure the script:

```markdown
![Disk Space Alert Email](linux/lab-2/Disk_space.png)

## Prerequisites

Before using the script, ensure you have the following packages installed:

- **msmtp**: A simple SMTP client to send mail.
- **mailutils**: A set of tools for managing mail.

Use your system's package manager to install these packages. For example, on Debian-based systems:

```bash
sudo apt-get update
sudo apt-get install msmtp mailutils



