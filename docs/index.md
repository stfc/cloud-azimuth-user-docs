---
hide:
  - footer
---

Azimuth science platforms are powered by [Azimuth](https://github.com/azimuth-cloud/azimuth/), a self-service portal for managing cloud resources with a particular focus on simplifying the use of cloud for scientific computing, high-performance computing (HPC) and artificial intelligence (AI).

If this is your first visit to the Azimuth portal, or you would just like to know more about how to get access to a cloud project - [get started](getting-started/getting-started.md) with Azimuth science platforms.

## Disclaimer
- The STFC Cloud Azimuth platform is still in development, therefore data loss could occur, and it is recommended that no data be stored on there that you do not wish to lose.
- Updates/patches of the platform may come at short notice, but we endeavour to give 1 weeks notice.
- Support for Azimuth related issues is only offered during regular working hours, with not out of hours support currently being offered.
- For any issues for feedback please contact us via STFC Cloud Support: [cloud-support@stfc.ac.uk](mailto:cloud-support@stfc.ac.uk)
- Please read the STFC Cloud Azimuth Platform SLA before use: [Link]

## Accessing
Azimuth can be accessed here: [https://portal.apps.cape.stfc.ac.uk](https://portal.apps.cape.stfc.ac.uk)

You log in as you would normally to the STFC Cloud interface, using FEDID, IAM authentication (IRIS-IAM, or SKA-IAM).  This will then take you to a screen where you select which of your projects you want to work in.

## Platforms
Platforms can be deployed directly from the Azimuth Platforms interface.

### [:simple-kubernetes: Kubernetes](platforms/kubernetes.md)
A fully-featured [Kubernetes](https://kubernetes.io/) container orchestration cluster.

## Kubernetes Applications
Kubernetes Applications require an existing [Kubernetes cluster](platforms/kubernetes.md) before they can be deployed.
### [:simple-jupyter: JupyterHub](platforms/kubernetes-applications/jupyterhub.md)
A multi-user JupyterHub on Kubernetes, powered by [zero-to-jupyterhub](https://zero-to-jupyterhub.readthedocs.io/en/latest/).

### [:simple-dask: DaskHub](platforms/kubernetes-applications/daskhub.md)
A multi-user DaskHub on Kubernetes. [Dask](https://docs.dask.org/en/stable/) is a flexible library for parallel computing in Python.

### [:simple-argo: ArgoCD](platforms/kubernetes-applications/argocd.md)
WIP

### [:logos-binderhub: BinderHub](platforms/kubernetes-applications/binderhub.md)
WIP

### [:simple-huggingface: HuggingFace-LLM](docs/platforms/kubernetes-applications/huggingface-llm.md)
WIP

### [:logos-kubeflow: KubeFlow](platforms/kubernetes-applications/kubeflow.md)
WIP

