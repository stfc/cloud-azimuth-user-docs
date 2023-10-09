---
hide:
  - footer
---

### Introduction
The Slurm platform provides a multi-node HPC environment based on the [Slurm workload manager](https://slurm.schedmd.com/) and [Open OnDemand](https://openondemand.org/). The platform is accessible with a web-browser using the Open OnDemand web-interface, or via [SSH](https://en.wikipedia.org/wiki/Secure_Shell). 

### Launch configuration
!!! Warning

    Platforms and their names are visible to all members of the cloud project!

|**Option**                                | **Explanation**|
-------------------------------------------|---------------------------|
|**Platform name**                        | A name to identify the Slurm platform.|
|**External IP** | Use the plus button to assign an external IP address to your cloud project if the list is empty, and then select an IP to assign to the login node of your Slurm platform.|
|**Compute node count**                  | The amount of Slurm compute (worker) nodes to configure for your Slurm platform.|
|**Compute node size**              | The size of the Slurm compute (worker) nodes. The options in this menu are set by the cloud operator, and the number of CPUs and quantity of RAM are displayed for each size.|
|**Run post-configuration validation?**                           |Run a small suite of tests to check that the Slurm platform is functioning as expected.|


### Advanced
#### Platform monitoring
A [Grafana](https://grafana.com/oss/grafana/) dashboard for system monitoring is included in the platform, and is accessible from the platforms page. General current and historical system information is visible.

Additionally, Open OnDemand presents monitoring dashboards for each Slurm job.
