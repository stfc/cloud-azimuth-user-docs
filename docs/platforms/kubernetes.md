---
hide:
  - footer
---

### Introduction
The Kubernetes platform provides a fully-featured Kubernetes container orchestration cluster, with included monitoring, ingress and application dashboards. It can be used for running [Kubernetes applications](../index.md#kubernetes-applications) within Azimuth, or custom installations using either [Helm Charts](https://helm.sh/) or [Kustomize](https://kustomize.io/) to manage Kubernetes manifests.

A [kubeconfig](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) file for use with `helm` or `kubectl` is provided in platform **Details** after the platform has been launched.

### Launch configuration
!!! Warning

    Platforms and their names are visible to all members of the cloud project!

|**Option**                                | Explanation|
|------------------------------------------|---------------------------|
|**Platform name**                         | A name to identify the Kubernetes cluster platform.|
|**Cluster template**                      | The cluster template defines the deployed Kubernetes [version](https://kubernetes.io/releases/), alongside any cluster-specific customisations defined by the cloud operator. There may be multiple templates for each Kubernetes version, and you may need to consult the cloud operator's documentation for information on how these are customised.|
|**Control Plane Size**                      | The size of the cloud instances to run the [Kubernetes control plane](https://kubernetes.io/docs/concepts/overview/components/#control-plane-components). The options in this menu are set by the cloud operator, and the number of CPUs and quantity of RAM are displayed for each size.|

#### Node groups
!!! Info
    
    All Kubernetes clusters must contain a least one node group of [Kubernetes worker nodes](https://kubernetes.io/docs/concepts/architecture/nodes/).

!!! Info
    
    If you are creating a Kubernetes cluster to use with [GPU-enabled Jupyter notebooks](kubernetes-applications/gpu-enabled-notebooks.md), be sure to select a Node Size that contains GPUs.

|**Option**                                | Explanation|
|------------------------------------------|---------------------------|
|**Name**                         | A name to identify the node group. Names are available inside the Kubernetes cluster as [node labels](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#built-in-node-labels).|
|**Node Size**                      | The size of the cloud instances that form the node group. The options in this menu are set by the cloud operator, and the number of CPUs and quantity of RAM are displayed for each size. Cloud sizes may also dictate access to other hardware, such as GPUs or high-speed network interfaces.|
|**Enable autoscaling for this node group?**                      | When autoscaling is **selected**, the amount of cloud instances in the node group will increase when existing resources are not sufficient to run the requested amount of pod resources. As the amount of requested pod resources declines, cloud instances are removed from the node group.<br/>When autoscaling is **not selected**, the size of the node group remains fixed.|
|**Node Count**                      | When autoscaling is **selected**, the minimum and maximum amount of cloud instances to allow in this node group. When autoscaling is **not selected**, the fixed amount of cloud instances in this node group. |


#### Cluster addons
!!! Info
    
    By default all cluster addons are enabled, they provide useful information about the state of your Kubernetes cluster and add additional functionality.

|**Option**                                | **Explanation**|
|------------------------------------------|---------------------------|
|**Enable Kubernetes Dashboard?**                         | The [Kubernetes dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) will be available from the platforms page.|
|**Enable cluster monitoring?**                      | A [Grafana](https://grafana.com/oss/grafana/) instance with pre-configured dashboards for visualising cluster telemetry will be available from the platforms page.|
|**Enable applications dashboard?**                      | A dashboard for simple installation of [Kubernetes applications](../index.md#kubernetes-applications) will be available from the platforms page.|

#### Advanced Options
!!! Danger
    
    Advanced options are set to reasonable defaults and changing them may result in unexpected behaviour, including Kubernetes clusters failing to deploy. **Do not change these unless you know what you are doing!**

|**Option**                                | **Explanation**|
|------------------------------------------|---------------------------|
|**Enable auto-healing?**                         | If enabled, the cluster will try to remediate unhealthy nodes automatically.|
|**Enable Kubernetes Ingress?**                      | Allows the use of [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) to expose services in the cluster via a load balancer. **Requires an external IP for the load balancer.**|
|**Enable cert-manager?**                      | Allows the use of [cert-manager](https://cert-manager.io/) to manage TLS certificates for cluster services.|
