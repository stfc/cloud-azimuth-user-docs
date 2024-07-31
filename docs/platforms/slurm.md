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

#### Root access

The `azimuth` user has passwordless sudo. Only this user can ssh between nodes so to get
sudo access to a non-login node ssh as `azimuth` from the login node first, then use sudo.

Note that node names can be retrieved from the `/etc/hosts` file on the login node, e.g.:

    cat /etc/hosts

#### Additional software

Software installed directly via `sudo` will be lost when the platform is upgraded, as upgrades are performed by reimaging all nodes with a new image.

Where possible, it is preferable to package additional software for use via [apptainer](https://apptainer.org/) which is installed on all Slurm platforms. This supports both SIF and Docker/OCI container formats.

Some software is also available via the EESSI pilot repository - follow instructions from [here](https://www.eessi.io/docs/using_eessi/setting_up_environment/).

If these methods are not appropriate and the software has wide applicability, consider making a PR to the [Slurm appliance repository](https://github.com/stackhpc/caas-slurm-appliance) which builds images for the Slurm platforms. Additional Ansible tasks could be added to the [extras.yml](https://github.com/stackhpc/ansible-slurm-appliance/blob/main/ansible/extras.yml) playbook.
