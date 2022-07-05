---
hide:
  - footer
---

### Introduction
The Linux Workstation platform provides a flexible [Ubuntu](https://ubuntu.com/) 20.04 cloud instance, with web-browser access to the graphical desktop or shell. Optionally, users may add an external IP address, which allows the instance to be accessed from a machine outside of the project using [SSH](https://en.wikipedia.org/wiki/Secure_Shell).

The workstation instance has a cloud volume (or virtual disk) available at `/data`, which may be useful for working with large datasets. The capacity of this cloud volume is configurable when launching the platform.

### Launch configuration
!!! Warning

    Platforms and their names are visible to all members of the cloud project!

|**Option**                                | Explanation|
|-------------------------------------------|---------------------------|
| **Platform name**                        | A name to identify the Linux Workstation platform.|
|**Workstation size**                      | The size of the cloud instance to run the workstation. The options in this menu are set by the cloud operator, and the number of CPUs and quantity of RAM are displayed for each size.|
|**Volume size**                           | The size (in Gigabytes) of the cloud volume (virtual disk) available at `/data`.|
|**External IP for SSH access (optional)** | Use the plus button to assign an external IP address to your cloud project if the list is empty, and then select an IP to assign to your workstation.|

### Advanced
#### Platform monitoring
A [Grafana](https://grafana.com/oss/grafana/) dashboard for system monitoring is included in the platform, and is accessible from the platforms page. General current and historical system information is visible.
