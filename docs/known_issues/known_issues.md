---
hide:
  - footer
---

The following is a list of known issues and potential workarounds for Azimuth. If something isn't listed here, please provide us feedback

## Quotas prediction may not be accurate
Azimuth's prediction of quota usage does not always properly calculate figures like RAM, and it doesn't consider i.e. number of security groups.

### Workaround
Care should be taken, for example using the OpenStack Web UI, that any deployed clusters fit into project quotas.

If this was not the case, you should request a quota is increased and update/upgrade the cluster via Azimuth.

## Some apps can fail to deploy, or notebooks fail to launch, with low worker CPUs
Apps may fail to deploy if your cluster has a limited count of workers; and this isn't obvious other than checking logs via the Monitoring System, or if the app shows logs in its web UI (i.e. JupyterHub launching a server).

In future, we will investigate a clearer way to alert users of this situation.

### Workaround
Make use of [Auto Scaling](../platforms/kubernetes.md#node-groups) on Worker node groups to ensure Azimuth can properly scale more worker nodes as needed to fill CPU reservation requirements. Be aware that, due to the default set of required Cluster Addons, and default apps (Monitoring/Kubernetes Dashboard), even idle clusters may already have too much compute served to allow apps to run with only one worker node.

If the maximum count of worker nodes has been autoscaled, that indicates Azimuth has a lot of compute reserved on this cluster. The maximum count should be increased, requesting an increase of OpenStack quota if required.

## GPU Node Labels take some time to apply
Newly created GPU-enabled node groups may take some time to apply relevant GPU-specific node labels.
This may cause issues with some apps not properly detecting GPU availability.

### Workaround
You should wait 5-10 minutes after creating a GPU-enabled worker node for feature discovery and driver setup to finish running.

You can follow the progress with `kubectl`. After connecting via the clusters kubeconfig, run `watch "kubectl get nodes -o=custom-columns=NAME:.metadata.name,GPUs:.status.capacity.'nvidia\.com/gpu'"` and wait for the worker node to show available capacity.

## Quota Usage Estimates are Incorrect for Kubernetes Clusters
Azimuth's estimates for quota usage when deploying or updating clusters are frequently incorrect, and do not consider every restricted resource type like Network Security Groups. This may mean clusters are deployed which will not successfully provision, with nodes getting stuck in Provisioning or Pending without obvious errors.

### Workaround
A temporary hotfix has been applied which should resolve quota estimation for CPU, RAM and Machine Count while we wait for a proper upstream fix. Users should manually and carefully check the remaining quotas via the [OpenStack Web UI (Horizon)](https://openstack.stfc.ac.uk/project/), especially Disk Volume usage and the different Networking usage restrictions for example security groups count and security group rules count.