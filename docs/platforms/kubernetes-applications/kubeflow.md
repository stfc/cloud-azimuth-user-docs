---
hide:
  - footer
---
!!! Warning

    Deploying KubeFlow requires an existing [Kubernetes cluster](../kubernetes.md) containing a node group with at least 16GB+ of RAM and 12+ CPUs, and ideally with a GPU.

    Deployment takes a long time as many large images need to be pulled. Progress can be followed via the [Kubernetes Dashboard](../kubernetes-cluster-addons/kubernetes_dashboard.md) in the Workloads tab of the Kubeflow namespace, or via `kubectl`.

### Introduction
[KubeFlow](https://www.kubeflow.org/) is a machine learning toolkit for Kubernetes clusters, using Jupyter Notebooks and [TensorFlow](https://www.tensorflow.org/).

For an introduction to using KubeFlow, see the [official documentation](https://www.kubeflow.org/docs/started/introduction/).

!!! Warning
    The KubeFlow app deployment is currently at a proof-of-concept stage and does not yet provide full integration with Azimuth's standard authentication and access management features.
    Full integration with the Azimuth identity provider is planned for a future release.

### Launch configuration

To get started, in the Platforms tab, press the <img loading="lazy" class="off-glb" src="../../../assets/images/new-platform-button.svg" style="height:1em; vertical-align:middle;"> New Platform button, and select KubeFlow.

KubeFlow requires a worker node cluster with 16GB+ of RAM and 12+ CPUs. Ideally, it should be a GPU flavor.

You will then be presented with launch configuration options to fill in:

|**Option**                                | **Explanation**|
|------------------------------------------|---------------------------|
|Platform name|A name to identify the KubeFlow platform|
|Kubernetes cluster|The Kubernetes platform on which to deploy KubeFlow. If one hasn't already been created, check out the [Kubernetes Overview](../kubernetes.md).|
|App version|The version of the KubeFlow Azimuth Application to use.|

#### Accessing KubeFlow
The default login credentials for KubeFlow are:

- username: user@example.com 
- password: 12341234
