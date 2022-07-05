---
hide:
  - footer
---

Azimuth science platforms are powered by [Azimuth](https://github.com/stackhpc/azimuth/), a self-service portal for managing cloud resources with a particular focus on simplifying the use of cloud for scientific computing, high-performance computing (HPC) and artificial intelligence (AI).

## Platforms
Platforms can be deployed directly from the Azimuth Platforms interface.
### [:fontawesome-solid-computer: Linux Workstation](platforms/linux-workstation.md)
A versatile Linux compute instance, which can be accessed using a web-browser.

### [:fontawesome-brands-python: Jupyter Notebook](platforms/jupyter-notebook.md)
A Jupyter notebook created from a [repo2docker-compatible](https://repo2docker.readthedocs.io/en/latest/) repository.

### [:fontawesome-solid-server: Slurm Cluster](platforms/slurm.md)
A multi-node [Slurm](https://slurm.schedmd.com/) batch-compute cluster.

### [:material-kubernetes: Kubernetes](platforms/kubernetes.md)
A fully-featured [Kubernetes](https://kubernetes.io/) container orchestration cluster.

## Kubernetes Applications
Kubernetes Applications require an existing [Kubernetes cluster](platforms/kubernetes.md) before they can be deployed.
### [:fontawesome-brands-python: Jupyterhub](platforms/jupyterhub.md)
A multi-user Jupyterhub on Kubernetes, powered by [zero-to-jupyterhub](https://zero-to-jupyterhub.readthedocs.io/en/latest/).