# README.md

## Lab Overview

This lab provides a step-by-step guide to build a Docker image from a Dockerfile hosted in a GitHub repository, push it to DockerHub, and deploy it on a Kubernetes cluster using Minikube. The deployment includes exposing the service, setting up network policies, and configuring Ingress to access the service using a custom domain. Additionally, it includes a step to create a route in OpenShift for the same deployment and service.

## Prerequisites

1. Docker installed on your local machine.
2. DockerHub account.
3. Minikube installed and running.
4. Kubectl command-line tool installed.
5. Git installed.

## Steps

### 1. Clone the Repository

Clone the GitHub repository containing the Dockerfile.

### 2. Build the Docker Image

Build the Docker image from the Dockerfile.

### 3. Push the Image to DockerHub

Log in to DockerHub and push the image.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/dockerhub.png)
### 4. Start Minikube

Start Minikube if it's not already running.

### 5. Create a Deployment

Create a deployment using the custom NGINX image.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/website.yml.png)
### 6. Expose the Deployment

Expose the deployment as a service.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/svc.yml.png)
### 7. Define a Network Policy

Create a network policy to allow traffic to the NGINX pods only from other pods within the same namespace.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/net-policy.png)
### 8. Enable NGINX Ingress Controller

Enable the NGINX Ingress controller using Minikube addons.
```bash
minikube addons enable ingress
```
### 9. Create an Ingress Resource

Create an Ingress resource to route traffic to the service.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/ingress.yml.png)
### 10. Update /etc/hosts

Update the `/etc/hosts` file to map the domain to the Minikube IP address. First, get the Minikube IP address. Then, edit the `/etc/hosts` file to add the Minikube IP address and map it to the custom domain.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/etc-hosts.png)
### 11. Access the Custom NGINX Service

Open a browser and access the service using the custom domain name.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/static%20website%20local.png)
### 12. Create a Route in OpenShift

If you want to create a route in OpenShift for the same deployment and service, you can use the `oc expose` command. Follow these steps:

1. First, log in to your OpenShift cluster using the `oc login` command.

2. After logging in, expose the service using the `oc expose` command:
   ```sh
   oc expose svc/static-website
   ```
   ![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/route-oc%20.png)
### 13. Check the Website by the Route Link
Once the route is created, you can check the website by accessing the route URL in a browser. Use the following command to get the route URL:
 ```sh
   oc get route static-website

   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-10/pictures/Screenshot%202024-06-03%20224115.png)
