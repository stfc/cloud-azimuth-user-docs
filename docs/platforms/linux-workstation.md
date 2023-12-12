---
hide:
  - footer
---

### Introduction
The Linux Workstation platform provides a flexible [Ubuntu](https://ubuntu.com/) 22.04 cloud instance, with web-browser access to the graphical desktop or shell. Optionally, users may add an external IP address, which allows the instance to be accessed from a machine outside of the project using [SSH](https://en.wikipedia.org/wiki/Secure_Shell).

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

#### EESSI
The [EESSI](http://www.eessi.io/docs/) software suite is included in the Workstation appliance. EESSI includes a diverse collection of toolkits and modules for research computing purposes.

A collection of EESSI demo environments are available in the [EESSI demo Github repository](https://github.com/EESSI/eessi-demo), which can be cloned using the command below:

```git clone https://github.com/EESSI/eessi-demo.git```

The TensorFlow demo in this repository is a illustrative example of how to make use of EESSI. To run this demo, it is first neccessary to source the EESSI bash environment using the following command:

```source /cvmfs/pilot.eessi-hpc.org/versions/2021.12/init/bash```

This script will initialize the Lua modules for the Software layer in the EESSI stack and source the neccessary environment variables. To get started with EESSI, the ``module avail`` command will list all modules avaliable to you in the environment. A successful initialization should result in an output resembling the one below.

```
[EESSI pilot 2021.12] $ module avail

------ /cvmfs/pilot.eessi-hpc.org/versions/2021.12/software/linux/x86_64/intel/haswell/modules/all ------
   ant/1.10.8-Java-11
   Arrow/0.17.1-foss-2020a-Python-3.8.2
   Bazel/3.6.0-GCCcore-9.3.0
   ...
```
With a functioning environment, it is possible to begin experimenting with the software included in EESSI. Enter the directory of the EESSI-demo repository we cloned earlier, then enter the TensorFlow directory. 

This TensorFlow project contains a demonstration 4-layer neural network model which runs against the MNIST digits dataset. It is possible to tinker with the ``TensorFlow-2.x_mnist-test.py`` script to setup a different model architecture or leave it in the default configuration. To initialise the model, execute the ``run.sh`` script inside the directory, which should produce an evaluation output like below.

```
[EESSI pilot 2021.12] $ ./run.sh 
2023-10-09 13:15:04.546828: I tensorflow/core/common_runtime/process_util.cc:146] Creating new thread pool with default inter op setting: 2. Tune using inter_op_parallelism_threads for best performance.
Epoch 1/5
1875/1875 [==============================] - 5s 3ms/step - loss: 0.2951 - accuracy: 0.9138
Epoch 2/5
1875/1875 [==============================] - 14s 7ms/step - loss: 0.1445 - accuracy: 0.9568
Epoch 3/5
1875/1875 [==============================] - 6s 3ms/step - loss: 0.1070 - accuracy: 0.9669
Epoch 4/5
1875/1875 [==============================] - 3s 2ms/step - loss: 0.0886 - accuracy: 0.9732
Epoch 5/5
1875/1875 [==============================] - 3s 2ms/step - loss: 0.0766 - accuracy: 0.9763
313/313 - 0s - loss: 0.0745 - accuracy: 0.9774

real    0m41.002s
user    2m24.151s
sys     1m54.599s
```
Guides on how to utilise EESSI further can be found [here](http://www.eessi.io/docs/using_eessi/eessi_demos/).


#### Podman

Podman is a container framework provided in the Workstation appliance for the purpose of building and running OCI containers. It is **strongly** recommended to install any software for the Workstation appliance via Podman, as software installed via the package manager or otherwise located outside of ``/home`` will be removed during image upgrades. In-place upgrades are not supported in the Workstation appliance to avoid dependancy issues between migrations, instead the ``/home`` directory is kept as a seperate partition and re-mounted after the Workstation has been re-imaged.

The Podman CLI is syntatically similar to the Docker CLI. For example, a Jupyter notebook with an accessible web interface can be deployed using Podman via the following commands.

To begin, clone the Jupyter notebook docker repository and navigate to the notebook directory as below:

```git clone https://github.com/jupyter/docker-stacks.git && cd docker-stacks/images/base-notebook```

Build the Jupyter notebook image, and select the docker.io remote when promoted by Podman:

```podman build . --tag jupyter-notebook```

Query the list of locally available images to ensure the Jupyter notebook container image was built correctly:

```podman image ls | grep jupyter-notebook```

Start the Jupyter notebook container:

```podman run --name notebook -p 8888:8888 jupyter-notebook```

Once the container has started, a link providing access to the web interface will be printed to the console. Navigating to this link in a web browser should present a Jupyter notebook web interface resembling the one shown below:

![Jupyter notebook web interface](/docs/assets/images/jupyter-notebook-interface.png)

As this is a base notebook it won't contain many applications to explore, more notebooks to build can be found in the [docker-stacks](https://github.com/jupyter/docker-stacks) repository and may have a similar setup procedure to the base notebook.

See the [Podman docs](https://docs.podman.io/en/latest/) for further information on using Podman.

#### Apptainer

Apptainer is another container framework commonly used in HPC applications which is also included in the Workstation appliance. It can be used in a similar way to Podman as both frameworks support OCI containers. OCI images from Docker Hub can be pulled with:

```apptainer run docker://jupyter/base-notebook```

The Apptainer console log should contain an access link to the notebook interface in the same manner as the above Podman example.
