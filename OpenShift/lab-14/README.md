# Deploy and Manage Applications in OpenShift using Helm Charts

## Introduction

Helm is a package manager for Kubernetes that allows you to define, install, and upgrade even the most complex Kubernetes applications. This guide provides step-by-step instructions to use Helm charts in an OpenShift cluster to deploy and manage applications.

## Objectives

1. Explore Helm charts for common services.
2. Create a new Helm chart for Nginx.
3. Deploy the Helm chart and verify the deployment.
4. Access the Nginx server.
5. Upgrade the deployment to Apache.
6. Rollback the deployment to Nginx.

## Prerequisites

- An OpenShift cluster up and running.
- `kubectl` and `oc` CLI tools installed and configured.
- Helm installed and configured.

## Steps

### 1. Create a New Helm Chart for Nginx

Create a new Helm chart named `nginx-chart`:

```sh
helm create nginx-chart
```

This will generate a directory structure for your Helm chart in the `nginx-chart` folder. The structure includes:
- `Chart.yaml`: Contains metadata about the chart.
- `values.yaml`: Contains default values for the chart.
- `templates/`: Contains Kubernetes manifest templates.

Modify the `values.yaml` file to use the Nginx image.

### 3. Deploy the Helm Chart and Verify the Deployment

Deploy the Helm chart to your OpenShift cluster:

```sh
helm install nginx ./nginx-chart
```

Verify the deployment:

```sh
kubectl get pods
kubectl get services
```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-14/pictures/nginx-deployed.png)
Ensure that the Nginx pod is running and the service is created.

### 4. Access the Nginx Server

Expose the Nginx service to access it from outside the cluster. You can use an OpenShift route to expose the service:

```sh
oc port-forward <podname> 8080:80
```

![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-14/pictures/port-forward.png)

Access the Nginx server using  your web browser.

### 5. Upgrade the Deployment to Apache

To upgrade the deployment to use the Apache image, update the `values.yaml` file in your Helm chart:

![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-14/pictures/apache-edit.png)

Upgrade the Helm release:

```sh
helm upgrade nginx ./nginx-chart
```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-14/pictures/helm-upgrade.png)
Verify the upgrade by checking the pods and accessing the `localhost:8080`.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-14/pictures/apache.page.png)
### 6. Rollback the Deployment to Nginx

If you need to rollback to the previous Nginx deployment, you can use the Helm rollback command:

```sh
helm rollback nginx 1
```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-14/pictures/rollback-to-nginx.png)
The `1` indicates the revision number to which you want to rollback. Verify the rollback by checking the pods and accessing the service URL again.
### 7. Refresh your browser page
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-14/pictures/nginx-again.png)
## Conclusion

By following these steps, you can use Helm charts to deploy and manage applications in an OpenShift cluster, easily switch between different application versions, and rollback to previous versions when necessary.



This README file provides a comprehensive guide to deploying and managing applications using Helm in an OpenShift cluster, including creating a Helm chart, deploying it, upgrading, and rolling back.
