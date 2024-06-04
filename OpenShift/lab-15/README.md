# Daemonsets and Taint and Toleration in Kubernetes

## Daemonsets

Daemonsets are a Kubernetes resource that ensures that a specific pod is running on all (or some) nodes in a Kubernetes cluster. This is useful for running system-level services, such as logging, monitoring, or network agents, that need to be present on every node.

Here are the steps to create a DaemonSet YAML file with a Pod template containing an Nginx container in OpenShift:

1. Create a YAML file for the DaemonSet:

   

2. Apply the DaemonSet YAML file using the `oc apply` command:
   ```
   oc apply -f nginx-daemonset.yaml
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-15/pictures/daemonset-yml.png)
3. Verify the number of pods created by the DaemonSet:
   ```
   oc get pods
   ```
   You should see one pod running on each node in your OpenShift cluster.

![daemonset-yml.png](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-15/pictures/daemonset.png)

## Taint and Toleration and NodeAfiinity

- Taints and tolerations work together to ensure that pods are not scheduled on inappropriate nodes. Taints are applied to nodes, and tolerations are added to pods.

- Node affinity in Kubernetes lets you control where pods run.  It uses labels to match pods with nodes that have specific characteristics, like having GPUs or extra memory.  This helps optimize pod placement for better performance and resource allocation.

- Node affinity can be even more powerful when used in conjunction with taints and tolerations. Taints are essentially labels applied to nodes that mark them as unsuitable for certain pods. Pods can have tolerations that allow them to run on tainted nodes. By combining these features, you can achieve very granular control over pod scheduling. For instance, you can taint a node for maintenance, preventing any pods from being scheduled there. Then, you can create a critical pod with a toleration for the maintenance taint, ensuring it continues to run even during maintenance. This approach ensures only authorized pods can run on specific nodes while maintaining flexibility for critical tasks. 

Here are the steps to taint a Minikube node with a specific key-value pair 'color=red', create a pod with toleration 'color=blue', and then change the toleration to 'color=red':

1. Start Minikube:   ```   minikube start   ```

2. Create a pod with toleration 'color=blue' and run ```kubectl aplly -f tolerant.yml ```: 
 ![adjust-blue-yml.png](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-15/pictures/adjust-blue-yml.png)

- The pod will remain in pending state because its toleration doesn't match the node's taint. 
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-15/pictures/blue-pending.png)
4. Change the toleration to 'color=red' ```kubectl aplly -f tolerant.yml ``` :
   .![adjust-red-yml.png](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-15/pictures/adjust-red-yml.png)
  - The pod is likely running successfully because its toleration matches the node's taint.
    ![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-15/pictures/red-running.png)

In summary, taints are used to mark nodes as unavailable for certain pods, and tolerations are used by pods to indicate that they can be scheduled on nodes with specific taints.
