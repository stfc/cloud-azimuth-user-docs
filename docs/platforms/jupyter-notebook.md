---
hide:
  - footer
---

### Introduction
The Jupyter Notebook platform opens an existing Jupyter notebook repository in an executable environment on a cloud instance, making the notebook code immediately reproducible. The notebook is [accessed](#accessing-the-platform) via a web browser.

The Jupyter notebook that you want to launch should be available from a [repo2docker-compatible](https://repo2docker.readthedocs.io/en/latest/index.html) repository, hosted at GitHub, GitLab, Zenodo, Figshare or Dataverse.
The underlying platform functions similarly to [Binder](https://mybinder.org/), and is able to launch any notebook repository that conforms to the [Reproducible Execution Environment Specification (REES)](https://repo2docker.readthedocs.io/en/latest/specification.html).

The Jupyter notebook instance has a cloud volume (or virtual disk) available at `/data`, which may be useful for working on 
large datasets that cannot be distributed with the notebook repository because of their size. The capacity of this cloud volume is configurable when launching the platform.

### Launch configuration
!!! Warning

    Platforms and their names are visible to all members of the cloud project!

|**Option**                                | Explanation|
-------------------------------------------|---------------------------|
|**Platform name**                        | A name to identify the Linux Workstation platform.|
|**Notebook repository**                  | A [REES](https://repo2docker.readthedocs.io/en/latest/specification.html) compliant Jupyter notebook repository URL.|
|**Jupyter notebook size**              | The size of the cloud instance to run the Jupyter notebook. The options in this menu are set by the cloud operator, and the number of CPUs and quantity of RAM are displayed for each size.|
|**Volume size**                           | The size (in Gigabytes) of the cloud volume (virtual disk) available at `/data`.|

### Advanced
#### Platform monitoring
A [Grafana](https://grafana.com/oss/grafana/) dashboard for system monitoring is included in the platform, and is accessible from the platforms page. General current and historical system information is visible.
