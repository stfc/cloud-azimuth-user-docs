---
hide:
  - footer
---
!!! Warning

    Deploying DaskHub requires an existing [Kubernetes cluster](../kubernetes.md).

### Introduction
[DaskHub](https://github.com/dask/helm-chart/tree/main/daskhub) provides a multi-user, Dask-Gateway enabled JupyterHub.

The DaskHub Kubernetes application is provided as part of the Azimuth science platforms collection. It is installed using the Applications dashboard of an Kubernetes cluster, which is powered by [Kubeapps](https://kubeapps.dev/). The Applications dashboard is available from the Services list of your Kubernetes cluster.

The Applications dashboard shows both installed Applications and a Catalog of applications available for installation. The applications in the catalog are determined by your cloud operator. To learn more about the Applications dashboard, visit the Kubeapps [documentation](https://kubeapps.dev/docs/latest/howto/dashboard/).


### Launch Process

1. In the Platforms tab, press the <img class="off-glb" src="../../assets/images/new_platform.png" style="height:1em; vertical-align:middle;"> New Platform button
