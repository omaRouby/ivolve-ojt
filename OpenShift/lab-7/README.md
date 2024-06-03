# Lab: Deploying NGINX and change The Image to Apache then Rollback to nginx with OPenShift

## Objectives
- Deploy NGINX using Kubernetes.
- Expose the NGINX deployment using a service.
- Use port forwarding to view the NGINX page locally.
- Switch to an Apache image and view the Apache page locally.
- Rollback to the NGINX deployment.

## Prerequisites
- A Kubernetes cluster set up and configured.
- `kubectl` command-line tool installed and configured to interact with your cluster.

## Steps

### 1. Deploy NGINX

1. **Create an NGINX Deployment**
    - Define a deployment for NGINX.
    - Ensure the deployment has a single replica.

2. **Create a Service for NGINX**
    - Expose the NGINX deployment using a ClusterIP service.

3. **Use Port Forwarding to View NGINX Page Locally**
    - Use `kubectl port-forward` to forward a local port to the NGINX service port.
    - Access the NGINX welcome page using the forwarded port.

### 2. Switch to Apache

1. **Update the Deployment to Use Apache Image**
    - Edit the NGINX deployment to use the Apache image (`httpd`).
    - Apply the changes and ensure the Apache pod is running.

2. **Use Port Forwarding to View Apache Page Locally**
    - Use `kubectl port-forward` to forward a local port to the Apache service port.
    - Access the Apache default page using the forwarded port.

### 3. Rollback to NGINX

1. **Rollback the Deployment to NGINX**
    - Use the `kubectl rollout undo` command to rollback to the previous NGINX deployment.
    - Verify the rollback and ensure the NGINX pod is running.

## Detailed Instructions

### 1. Deploy NGINX

#### Create an NGINX Deployment
1. Define an NGINX deployment YAML file (`nginx-deploy.yaml`).
 ![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-7/pictures/nginx-deploy.png)
2. Apply the deployment using `kubectl apply`.

#### Create a Service for NGINX
1. Define a service YAML file to expose the NGINX deployment (`nginx-service.yaml`).
2. Apply the service using `kubectl apply`.

#### Use Port Forwarding to View NGINX Page Locally
1. Forward a local port to the NGINX service port:
    ```sh
    kubectl port-forward svc/nginx-service 8080:80
    ```
    ![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-7/pictures/apply%26port-forward.png)
2. Open a browser and navigate to `http://localhost:8080` to see the NGINX welcome page.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-7/pictures/localhost-nginx.png)
### 2. Switch to Apache

#### Update the Deployment to Use Apache Image
1. Edit the NGINX deployment YAML file to use the Apache image (`httpd`).
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-7/pictures/apacheImage-change.png)
2. Apply the updated deployment using `kubectl apply`.
3. Verify the Apache pod is running.

#### Use Port Forwarding to View Apache Page Locally
1. Forward a local port to the Apache service port:
    ```sh
    kubectl port-forward svc/nginx-service 8080:80
    ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-7/pictures/port-forward-apache.png)
2. Open a browser and navigate to `http://localhost:8080` to see the Apache default page.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-7/pictures/localhost-apache.png)
### 3. Rollback to NGINX

#### Rollback the Deployment to NGINX
1. Use the following command to rollback the deployment:

    ```sh
    kubectl rollout undo deployment/nginx-deployment
    ```
   ![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-7/pictures/rollout.png) 
2. Verify the rollback and ensure the NGINX pod is running:
    ```sh
    kubectl get pods
    ```

## Conclusion
By following these steps, you have successfully deployed an NGINX server, exposed it using a service, viewed it locally using port forwarding, switched to an Apache server, and rolled back to the NGINX deployment.
