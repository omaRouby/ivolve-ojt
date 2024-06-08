**Lab: Source-to-Image (S2I) Workflow**

### Overview
This lab demonstrates the Source-to-Image (S2I) workflow in OpenShift, which enables the building of container images directly from application source code. In this lab, we'll clone an HTML application repository from GitHub, create a BuildConfig in OpenShift to build the HTML application using the Nginx builder image, start the build process, monitor the build progress, and finally expose the service to access the website.

### BuildConfig (BC) and ImageStream (IS) in OpenShift

- **BuildConfig (BC)**: A BuildConfig is a Kubernetes resource that defines a build process for a particular application. It specifies the source code, builder image, and other build parameters. When you create a BuildConfig, OpenShift automatically starts the build process based on the defined configuration.

- **ImageStream (IS)**: An ImageStream is a Kubernetes resource that represents a collection of container images. It acts as a repository for storing and managing images. When a new image is pushed to an ImageStream, OpenShift automatically updates any associated DeploymentConfigs to use the latest image.


### Lab Steps

1. **Clone the HTML Application Repository from GitHub**
   ```sh
   git clone https://github.com/IbrahimmAdel/html.git
   ```

2. **Create a BuildConfig in OpenShift**
   ```sh
   oc new-app nginx:latest~https://github.com/IbrahimmAdel/html.git --name=my-html-app
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-16/pictures/create-bc.png)

3. **Start the Build Process**
   ```sh
   oc start-build my-html-app
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-16/pictures/oc-build.png)

4. **View Build Logs and Monitor Progress**
   ```sh
   oc logs -f bc/my-html-app
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-16/pictures/logs-bc.png)

5. **Check BuildConfig, Build, and ImageStream**
   ```sh
   oc get bc
   oc get build
   oc get is
   ```

6. **Check Deployment**
   ```sh
   oc get deployment
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-16/pictures/get-deploy.png)

7. **Check Service and Expose**
   ```sh
   oc get svc
   oc expose svc my-html-app
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-16/pictures/get-svc.png)

8. **Check Route**
   ```sh
   oc get route
   ```
![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-16/pictures/get-route.png)

9.  **Check URL**

    ![](https://github.com/omaRouby/ivolve-ojt/blob/main/OpenShift/lab-16/pictures/route-page.png)
### Conclusion
This lab demonstrates how to use the Source-to-Image (S2I) workflow in OpenShift to build and deploy containerized applications. By leveraging BuildConfigs, ImageStreams, and DeploymentConfigs, developers can streamline the process of building, deploying, and managing applications on the OpenShift platform.
