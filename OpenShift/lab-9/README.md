# Persistent Volumes (PV) vs. Persistent Volume Claims (PVC) vs. Storage Classes: Deployment Example

## Introduction

This README provides a comprehensive comparison between Kubernetes Persistent Volumes (PV), Persistent Volume Claims (PVC), and Storage Classes, along with a practical example demonstrating the behavior of deployments with and without persistent storage.
### Persistent Volumes (PV)

Persistent Volumes are storage resources in Kubernetes that exist independently of Pods. They can be pre-configured directories on the host machine or provisioned from external sources such as NFS servers or cloud storage providers.

PVs provide a way for cluster administrators to abstract the details of storage implementation from application developers. This separation allows for greater flexibility in managing storage resources, as administrators can define storage classes and policies without impacting application development.

### Persistent Volume Claims (PVC)

Persistent Volume Claims are requests for storage by Pods. They serve as an abstraction layer between applications and storage resources, allowing developers to request storage without needing to know the details of the underlying storage infrastructure.

PVCs specify storage requirements such as access mode, size, and storage class. While PVCs do not directly choose a storage class, they reference a storage class that defines the provisioning policy for the requested storage. This separation of concerns simplifies the process of requesting and managing storage resources in Kubernetes environments.

### Storage Classes

Storage Classes provide a way to dynamically provision storage in Kubernetes. They define policies and configurations for provisioning storage based on predefined parameters such as access mode, size, and storage backend.

Storage Classes abstract the details of storage implementation from PVC users, allowing developers to request storage based on predefined classes rather than specific storage resources. This abstraction simplifies the process of provisioning storage and enables automation and scalability in Kubernetes environments.



###  Why Use Storage Classes ?

- **Abstraction Layer**: Storage Classes provide an abstraction layer between PVCs and PVs, allowing developers to request storage based on predefined classes rather than specific storage resources. This separation of concerns simplifies the process of managing storage in Kubernetes environments.

- **Dynamic Provisioning**: Storage Classes enable dynamic provisioning of storage based on predefined policies and configurations. This automation simplifies the process of scaling applications and reduces administrative overhead.

- **Ease of Use**: Storage Classes abstract the details of storage implementation from PVC users, providing a user-friendly experience for developers. Developers only need to specify the desired storage class, rather than worrying about the specifics of individual PVs.

## Deployment Example

### Step 1: Deploy Nginx without PVC

1. Create a Kubernetes Deployment  for Nginx without specifying a PVC.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/nopvc-deployment.png)
2. Deploy the Nginx Deployment to the Kubernetes cluster.
```bash
oc apply -f nginx-noPVC.yml
```
3. Verify that the Nginx Pod is running and accessible.

```bash
oc get pods
```

### Step 2: Deploy Nginx with PV

1. Create a Kubernetes Deployment for Nginx with a PVC .
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/nginx-pvc-deploy.png)
2. Create a PVC 
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/pvc-yml.png)
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/get-pv.png)
3. Deploy the Nginx Deployment to the Kubernetes cluster.
```bash
oc apply -f nginx-pvc.yml
```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/apply-pv-deploy.png)
4. Verify that the Nginx Pod is running and accessible.

```bash
oc get pods
```

### Step 3: Echo "Hello" in Default HTML Path

1. exec into the Nginx Pods deployed in both steps.
2. Navigate to the default HTML path (/usr/share/nginx/html).
3. Echo "Hello" into an index.html file in both Pods.
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/nopvc-hello.png)

![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/echoHello-pv-deploy.png)

### Step 4: Delete Pods

1. Delete both Nginx Pods from the Kubernetes cluster.
   
```bash
oc  delete pod <podname>
```

### Step 5: RecreatePods

1. Verify that the Nginx Pods are running and accessible.

```bash
oc get pods
```
### Step 6: Verify Data Persistence

1. execute into the Nginx Pods deployed in both steps.
2. Check if the index.html file with "Hello" exists in the default HTML path (/usr/share/nginx/html).
3. Confirm that the Nginx Pod with the PVC (using PV) retains the "Hello" data, while the Pod without PVC does not.
.**The data is lost in the delpoyment without a pvc**
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/nopvcdelete-exec-again.png)
.**The data is the same in the delpoyment with a pvc**
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-9/pictures/new-pod-pv-hello.png)
## Conclusion

This deployment example demonstrates the behavior of Nginx Deployments with and without persistent storage in Kubernetes environments. It illustrates how Persistent Volumes and Claims ensure data persistence across Pod recreation, while deployments without persistent storage lose data upon recreation.
