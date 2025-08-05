---
hide:
  - footer
---
!!! Warning

    Deploying ArgoCD requires an existing [Kubernetes cluster](../kubernetes.md).

### Introduction
[ArgoCD](https://argo-cd.readthedocs.io/en/stable/) provides a declarative GitOps Continuous Delivery (CD) platform for Kubernetes clusters.

### Launch configuration

To get started, in the Platforms tab, press the <img loading="lazy" class="off-glb" src="../../../assets/images/new-platform-button.svg" style="height:1em; vertical-align:middle;"> New Platform button, and select ArgoCD.

You will then be presented with launch configuration options to fill in:

|**Option**                                | **Explanation**|
|------------------------------------------|---------------------------|
|Platform name|A name to identify the ArgoCD platform|
|Kubernetes cluster|The Kubernetes platform on which to deploy ArgoCD. If one hasn't already been created, check out the [Kubernetes Overview](../kubernetes.md).|
|App version|The version of the ArgoCD Azimuth Application to use.|