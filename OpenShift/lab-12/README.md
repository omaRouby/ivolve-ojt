# README.md

## Lab Overview

This lab provides a step-by-step guide to set up a Kubernetes environment with specific resource limits and configurations within a dedicated namespace. The steps include creating a namespace, applying a resource quota to limit resource usage, deploying MySQL within this namespace using ConfigMap and Secret for configuration management, and verifying the MySQL configuration by accessing the MySQL pod.

## Steps

### 1. Create a Namespace

Create a namespace named `nti`.
```bash
kubectl create namespace nti
```
### 2. Apply Resource Quota

Apply resource quota to limit resource usage within the `nti` namespace. Set the resource requests to CPU: 0.5 vCPU and Memory: 1G, and resource limits to CPU: 1 vCPU and Memory: 2G.
```bash
kubectl apply -f resource-quota.yaml -n nti

```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-12/pictures/resaurce-quata.png)

### 3. Create a ConfigMap

Create a ConfigMap to define the MySQL database name and user. This ConfigMap will be used by the MySQL deployment to configure the database.
```bash
kubectl apply -f mysql-config.yml

```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-12/pictures/confg.png)
### 4. Create a Secret

Create a Secret to store the MySQL root password and user password securely. This Secret will be used by the MySQL deployment to access the database securely.
```bash
kubectl apply -f mysql-secret.yml

```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-12/pictures/secret.png)

### 5. Create a Deployment for MySQL

Create a Deployment within the `nti` namespace for the MySQL pod. Use a ConfigMap to define the MySQL database name and user, and use a Secret to store the MySQL root password and user password.
```bash
kubectl apply -f mysql-deploy.yaml -n nti

```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-12/pictures/mysql-deploy.png)
### 6. Verify MySQL Configuration

Exec into the MySQL pod within the `nti` namespace and verify the MySQL configuration to ensure that the database name, user, and passwords are properly set.
```bash
kubectl exec -it <mysql-pod-name> 

```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-12/pictures/mysql%20login.png)
By following these steps, you will have successfully set up a Kubernetes environment with resource quotas, deployed MySQL with proper configuration management, and verified the MySQL configuration within a dedicated namespace.
