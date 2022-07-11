---
hide:
  - footer
---
!!! Warning

    Deploying Jupyterhub requires an existing [Kubernetes cluster](../kubernetes.md).

### Introduction
[DaskHub](https://github.com/dask/helm-chart/tree/main/daskhub) provides a multi-user, Dask-Gateway enabled JupyterHub.

The DaskHub Kubernetes application is provided as part of the Azimuth science platforms collection. It is installed using the Applications dashboard of an Kubernetes cluster, which is powered by [Kubeapps](https://kubeapps.dev/). The Applications dashboard is available from the Services list of your Kubernetes cluster.

The Applications dashboard shows both installed Applications and a Catalog of applications available for installation. The applications in the catalog are determined by your cloud operator. To learn more about the Applications dashboard, visit the Kubeapps [documentation](https://kubeapps.dev/docs/latest/howto/dashboard/).


### Launch process
!!! Warning

    Before deploying DaskHub, ensure that you are working in the correct Kubernetes namespace, which is likely to be "default" unless you are an advanced user. View and change your current namespace using the "Current Context" dialog in the top-right of the Applications dashboard.

1. Follow the Kubeapps [documentation](https://kubeapps.dev/docs/latest/howto/dashboard/) to deploy an application, selecting **daskhub-azimuth** as the application that you wish to deploy.

1. When prompted, use the form to customise your deployment:

    | Option | Explanation |
    |--------|-------------|
    | **Name** | A name for your JupyterHub deployment. Names must be unique per-namespace. |
    | **JupyterHub identifier** | The name that your JupyterHub service will have in the Services list of your Kubernetes cluster. |
    | **Jupyterhub API Token** | A random string used as keys to enable communication between the JupyterHub and Dask Gateway. Generate using `openssl rand -hex 32`.|
    | **Jupyterhub API Token Confirm** | The same string as the one given in **Jupyterhub API Token**. |
    | **CPU guarantee for each single user notebook** | Singleuser notebooks will only launch on a Kubernetes worker node with this many free [CPUs](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu). |
    | **CPU limit for each single user notebook** | Singleuser notebooks will be limited to using this amount of [CPU](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu). |
    | **Memory guarantee for each single user notebook** | Singleuser notebooks will only launch on a Kubernetes worker node with this much free [memory](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-memory). |
    | **Memory limit for each single user notebook** | Singleuser notebooks will be limited to using this amount of [memory](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-memory). |
    | **Local storage capacity for each user notebook** | Singleuser notebooks will have cloud volumes (virtual disks) of this size attached to them. |
    
1. When you have completed the form, start the deployment.

1. After the deployment has completed, your JupyterHub instance is available from the Services menu of your Kubernetes cluster.

