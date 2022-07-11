---
hide:
  - footer
---

# GPU-Enabled Jupyter Notebooks

!!! Warning

    Deploying a GPU enabled Jupyter Notebook requires an existing [Jupyterhub](../../platforms/kubernetes-applications/jupyterhub.md) deployment, which itself requires an existing [Kubernetes cluster](../../platforms/kubernetes.md).

### Introduction

When you have followed the instructions for creating a [JupyterHub](../../platforms/kubernetes-applications/jupyterhub.md) deployment, JupyterHub is accessible from the Platforms page:

![Azimuth Kubernetes services list, showing JupyterHub in the list of available services](../../assets/images/platforms-jupyterhub-services.png){: style="height:500px"}


### Launch process
!!! Warning

    Before deploying Jupyterhub, ensure that you are working in the correct Kubernetes namespace, which is likely to be "default" unless you are an advanced user. View and change your current namespace using the "Current Context" dialog in the top-right of the Applications dashboard.

1. Deploy a [Kubernetes](../kubernetes.md) cluster.

1. Deploy [JupyterHub](jupyterhub.md).

1. Return to the Platforms page and select the JupyterHub service from the Kubernetes platform services list.

1. Select a GPU-enabled Jupyter Notebook server from the list of options. This server type contains NVIDIA drivers for interacting with NVIDIA GPU hardware, alongside the Python [Tensorflow](https://www.tensorflow.org/) machine learning library.

    ![Description of a GPU-enabled notebook server](../../assets/images/gpu-enabled-notebook-server.png)

1. Ensure that your notebook can communicate with the NVIDIA GPU:

```bash
jovyan@jupyter-matta-5fstack:~$ nvidia-smi 
Mon Jul 11 17:44:50 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 510.47.03    Driver Version: 510.47.03    CUDA Version: 11.6     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA A100-SXM...  On   | 00000000:00:05.0 Off |                    0 |
| N/A   34C    P0    50W / 500W |      0MiB / 81920MiB |      0%      Default |
|                               |                      |             Disabled |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```