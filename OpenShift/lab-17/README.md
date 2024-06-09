**README.md**

# ArgoCD Installation using Operator

This guide will walk you through the installation of ArgoCD using its Operator. ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes.

## Prerequisites

- `kubectl` installed on your system.
- Access to a Kubernetes cluster.

## Installation Steps

1. **Create a Namespace**: Create a namespace named `argocd` where ArgoCD will be installed.
    ```bash
    kubectl create namespace argocd
    ```

2. **Apply Installation Manifests**: Apply the installation manifests for ArgoCD from its official repository.
    ```bash
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-17/picture/create-ns%26install.png)

3. **Patch Service Type**: Patch the service type of `argocd-server` to `LoadBalancer` to expose it externally (if needed).
    ```bash
    kubectl patch svc argocd-server -n argocd 
    ```
![]()

4. **Verify Installation**: Check if the ArgoCD pods are running.
    ```bash
    kubectl get pods -n argocd
    ```


5. **Port Forwarding**: Forward the port of `argocd-server` to your local machine.
    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8080:443
    ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-17/picture/port-forward-svc.png)

6. **Retrieve Initial Password**: Get the initial password for the admin user.
    ```bash
    argocd admin initial-password -n argocd
    ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-17/picture/initial-pass%26login.png)

7. **Login to ArgoCD**: Login to the ArgoCD UI using the retrieved initial password.
    ```bash
    argocd login localhost:8080 --username admin --password <initial_password> --insecure
    ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-17/picture/initial-pass%26login.png)

8. **Change Password**: Optionally, change the password for the admin user.
    ```bash
    argocd account update-password
    ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-17/picture/update-password.png)

## Accessing ArgoCD

Once you've accessed the ArgoCD UI, you can log in using the default username and password:

- Username: `admin`
- Password: `<new-passwor>`
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-17/picture/argocd-console.png)


