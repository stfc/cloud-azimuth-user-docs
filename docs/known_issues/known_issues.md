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