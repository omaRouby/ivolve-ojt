# Multi-container Application Deployment with Jenkins

## What is the difference between Readiness & Liveness, Init & Sidecar Containers

### Readiness vs. Liveness Probes
- **Readiness Probe**: Determines if a container is ready to start accepting traffic. If a container fails the readiness check, it will be removed from the service endpoints. This ensures that traffic is not sent to a container that isn't ready to handle it.
- **Liveness Probe**: Determines if a container is still running. If a container fails the liveness check, it will be restarted. This ensures that the application recovers from failures.

### Init Containers vs. Sidecar Containers
- **Init Container**: Runs before the main application container starts. Used for setup tasks that need to be completed before the application starts. Each init container must complete successfully before the next one starts.
- **Sidecar Container**: Runs alongside the main application container and is used to provide support functions for the main container. These can include logging, monitoring, or proxy services.

## Objective

The objective is to create a deployment for Jenkins with the following specifications:
1. An init container that sleeps for 10 seconds before the Jenkins container starts.
2. Use readiness and liveness probes to monitor Jenkins.
3. Create a NodePort service to expose Jenkins.
4. Verify that the init container runs successfully and Jenkins is properly initialized.

## Steps to Create the Multi-container Application

1. **Create Deployment YAML**:
    - Define an init container that sleeps for 10 seconds.
    - Define a Jenkins container with appropriate readiness and liveness probes.
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins

spec:
  replicas: 1
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      initContainers:
      - name: init
        image: alpine:latest  # Using alpine image 
        command: ["sh", "-c", "sleep 10"]  # Sleep for 10 seconds
      containers:
      - name: jenkins
        image: jenkins/jenkins:lts
        ports:
        - containerPort: 8080
        
```
2. **Configure Readiness and Liveness Probes**:
    - Use HTTP GET or TCP socket checks for the probes.
    - Define the endpoints and success criteria for the probes.
  
```yml
        livenessProbe:
          httpGet:
            path: /login
            port: 8080
          initialDelaySeconds: 30  # Check after 30 seconds
          periodSeconds: 20      # Check every 20 seconds
          failureThreshold: 3     # Consider unhealthy after 3 failures
        readinessProbe:
          httpGet:
            path: /login
            port: 8080
          initialDelaySeconds: 15  # Check after 15 seconds
          periodSeconds: 10      # Check every 10 seconds
          failureThreshold: 5     # Consider unhealthy after 5 failures
```

3. **Create NodePort Service**:
    - Define a NodePort service in the YAML to expose the Jenkins container on a specific port.
```yml
apiVersion: v1
kind: Service
metadata:
  name: jenkins-service
spec:
  type: NodePort
  selector:
    app: jenkins
  ports:
  - port: 8080
    targetPort: 8080
    nodePort: 30080  # Replace with a desired port number (above 30000)

```      

4. **Deploy to Kubernetes**:
    - Apply the configuration using `kubectl apply -f <deployment.yaml>`.
    - Check the status of the pods using `kubectl get pods`.
    - Verify the logs to ensure the init container runs and completes successfully.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-13/pictures/pod-logs.png)
5. **Access Jenkins**:
    - Retrieve the NodePort assigned using `kubectl get services`.
    - Access Jenkins through the NodePort URL.
      
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-13/pictures/localhost8080.png)
By following these steps, you will be able to create a multi-container application deployment with Jenkins, ensuring proper initialization, monitoring, and external accessibility.
