# Kubernetes ServiceAccount and Role Setup

## Comparison between Role & RoleBinding and ClusterRole & ClusterRoleBinding

### Role and RoleBinding
- **Role**: 
  - A Role in Kubernetes is used to define permissions within a specific namespace. 
  - It allows you to grant access to resources (such as pods, services, and secrets) within that namespace.
  - Example: A Role named `pod-reader` can be created to allow read-only access to pods in a specific namespace.

- **RoleBinding**: 
  - A RoleBinding attaches a Role to a user, group, or ServiceAccount within a specific namespace.
  - It specifies who can perform the actions defined in the Role.
  - Example: A RoleBinding can be created to bind the `pod-reader` Role to a specific ServiceAccount.

### ClusterRole and ClusterRoleBinding
- **ClusterRole**:
  - A ClusterRole is similar to a Role but is not limited to a specific namespace.
  - It can define permissions cluster-wide or across all namespaces.
  - Example: A ClusterRole can be created to allow read-only access to all pods across the entire Kubernetes cluster.

- **ClusterRoleBinding**:
  - A ClusterRoleBinding attaches a ClusterRole to a user, group, or ServiceAccount at the cluster level.
  - It specifies who can perform the actions defined in the ClusterRole across the entire cluster.
  - Example: A ClusterRoleBinding can be created to bind a read-only ClusterRole to a specific ServiceAccount, granting cluster-wide read access to pods.

---

## Steps to Create a ServiceAccount, Role, RoleBinding, and Retrieve the ServiceAccount Token

### Step 1: Create a ServiceAccount
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-11/pictures/sa.png)
### Step 2: Define a Role
1. Create a Role that allows read-only access to pods 
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-11/pictures/role.png)
### Step 3: Bind the Role to the ServiceAccount
1. Bind the Role to the ServiceAccount using 
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-11/pictures/role-bind.yml.png)
### Step 4: Get the ServiceAccount Token

1. **Manually create a secret & Associate the secret with the ServiceAccount**:

  ![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-11/pictures/secret.png)



2. **Retrieve the ServiceAccount token**:
   - Get the token from the secret using:
     ```sh
     kubectl get secret <secret-name> --namespace=<namespace> -o jsonpath="{.data.token}" | base64 --decode
     ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-11/pictures/yml.token.png)
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-11/pictures/sa-pod-output.png)
## Conclusion

By following the steps outlined above, you can successfully create a ServiceAccount, define a Role for read-only access to pods within a specific namespace, bind the Role to the ServiceAccount, and manually create and associate a secret to retrieve the ServiceAccount token. This setup ensures that the ServiceAccount has the necessary permissions to access pods as specified, while also demonstrating how to manage Kubernetes RBAC (Role-Based Access Control) effectively.
