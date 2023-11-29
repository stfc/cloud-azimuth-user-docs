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
The [EESSI](http://www.eessi.io/docs/) suite of software is included in the Workstation appliance. EESSI includes a diverse collection of toolkits and modules for research computing purposes.

The EESSI demo environments are available in the [EESSI demo Github repository](https://github.com/EESSI/eessi-demo), which can be cloned using the command below:

```git clone https://github.com/EESSI/eessi-demo.git```

As an example, we can run the TensorFlow demo environment to ensure the environment is setup correctly. It is first neccessary to source the EESSI bash environment, to do this please run the following command.

```source /cvmfs/pilot.eessi-hpc.org/versions/2021.12/init/bash```

This script will initialize the Lua modules for the Software layer in the EESSI stack and source the neccessary environment variables for you to interact with them. To assess whether the script completed successfully, you can try run the ``module avail`` command to list all modules avaliable to you in the environment. A successful initialization should result in an output resembling the one below.

```
[EESSI pilot 2021.12] $ module avail

------ /cvmfs/pilot.eessi-hpc.org/versions/2021.12/software/linux/x86_64/intel/haswell/modules/all ------
   ant/1.10.8-Java-11
   Arrow/0.17.1-foss-2020a-Python-3.8.2
   Bazel/3.6.0-GCCcore-9.3.0
   ...
```
Now you have a functioning environment, you can begin experimenting with the software included in EESSI. Enter the directory of the EESSI-demo repository we cloned earlier, then enter the TensorFlow directory. 

This TensorFlow project contains a demonstration 4-layer neural network model which runs against the MNIST digits dataset. You can tinker with the ``TensorFlow-2.x_mnist-test.py`` script to setup a different model architecture as you like. To run the default configuration, you can execute the ``run.sh`` script inside the directory, which should produce an evaluation output like below.

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

Podman is a container framework provided in the Workstation appliance for the purpose of installing, managing and developing OCI containers. We **strongly** recommend installing any software you wish to add to the your Workstation via podman, as software installed via the package manager or otherwise located outside of ``/home`` will be removed during image upgrades. In-place upgrades are not supported in the Workstation appliance as to reduce dependancy issues between migrations, instead your ``/home`` directory is kept as a seperate partition and re-mounted after the Workstation has been re-imaged.

The podman CLI is syntatically similar to the Docker CLI. For instance, we can build and deploy a Jupyter notebook as an example using Podman and access our deployment in the web interface:

To begin, clone the Jupyter notebook docker repository and navigate to the notebook directory as below:

```git clone https://github.com/jupyter/docker-stacks.git && cd docker-stacks/images/base-notebook```

Build the Jupyter notebook image, and select the docker.io remote when promoted by podman:

```podman build . --tag jupyter-notebook```

Query the list locally available images to ensure the Jupyter notebook built correctly:

```podman image ls | grep jupyter-notebook```

Start the Jupyter notebook container:

```podman run --name notebook -p 8888:8888 jupyter-notebook```

Once the container has finished starting Jupyter notebook will print an access link to the web interface in the console, after navigating to this link in your web browser you should see the Jupyter notebook web interface as shown below:

![Jupyter notebook web interface](/docs/assets/images/jupyter-notebook-interface.png)

As this is a base notebook it won't contain many applications for you to explore, you can find more notebooks to build in the [docker-stacks](https://github.com/jupyter/docker-stacks) repository and re-use our previous steps. If setting up the notebook didn't produce any unexpected behaviour, podman is running correctly in your Workstation appliance. For more advanced information about using podman, you can check out the docs [here](https://docs.podman.io/en/latest/).

#### Apptainer

Apptainer is another container framework included in the Workstation appliance commonly used in HPC applications, we can use it in a similar way to Podman as both frameworks support OCI containers. We can pull OCI images from Docker Hub similar to Podman:

```apptainer run docker://jupyter/base-notebook```

The Apptainer console log should contain an access link to the dashboard like Podman.

#### Custom Images

Building custom images is supported in Azimuth and there may be several reasons why you want to do this. For introductory purposes we will focus on only adding a single program in this guide. There may be cases where you want to modify the community images more than this, we will briefly touch on upstreaming images and 'Continuous Integration' at the end of this guide.

You can build your own custom images for Azimuth using the 'azimuth-images' repository as a base. To begin exploring, clone the repository as below:

```git clone https://github.com/stackhpc/azimuth-images.git```

You'll notice several different directories here each with their own purpose, for now we wil focus on the ``ansible`` directory. This directory contains playbooks that add configuration and packages to the 'base' images. In the case of a Workstation appliance, base images will typically be an empty Ubuntu image, we use these playbooks to add VNC/Guacamole configuration, Podman and Zenith support allowing these images to be used in the Azimuth ecosystem.

In the ``roles`` directory you can see each indivdual component modularised as Ansible roles, in this architecture we can re-purpose code that we may use on multiple different applicances/images (e.g. Zenith). To make a direct change to the Workstation appliance, we can edit the ``linux-webconsole`` role. To have Ansible install 'GNU Octave' as an example, we need to add a task to the `main.yml` playbook as below:

```
- name: Install Octave
  apt:
    name: octave
    state: present
```
Now we have modifed the playbook to install another package, we can use 'Packer' to generate the image. Using Packer requires that you have access to a cloud with a floating IP. Assuming this is the case, you need to define a Packer configuration file for the cloud you're building on. The configuration file used for building images on Sausage Cloud (sausage.pkvars.hcl) looks like this:

```
source_image_name = "packer-d32bd27c-3b34-4fab-b8ad-e491147a60da"

network = "4ca2399f-3040-4686-82fa-e99bd50d215a"
floating_ip = "842fd1f3-0e6f-42e2-aa42-045cf58535b9"
security_groups = ["default"]

flavor = "cumberland"
distro_name = "ubuntu-jammy"
ssh_username = "ubuntu"
volume_size = 20
```
To begin the Packer build process for the Workstation image, you need to run the following command where PATH_TO_VARS_FILE is the location of your Packer configuration file:

```
packer build --on-error=ask -var-file=$PATH_TO_VARS_FILE packer/linux-desktop.pkr.hcl
```
You will see the build process begin in the output, eventually during runtime you should notice the Ansible task we wrote earlier completing successfully. Installing the desktop environment will take a long time, expect this build process to take over 30 minutes depending on your hardware. After build completion, you will notice the OpenStack image ID printed to the console by Packer. To use this in your Azimuth configuration, you will need to declare the ``azimuth_caas_stackhpc_workstation_image`` variable and assign the image ID to this variable in your ``azimuth-config`` repository.

##### Upstream contributions

If you believe your changes will be valuable to other users, you can contribute your changes to the StackHPC community images [repository](https://github.com/stackhpc/azimuth-images). To do this, you will need to commit, push and create a pull request. (Hint: If you've followed the guide this far, your changes are already in the correct repository and ready to be pushed!)

##### The role of Continuous Integration

You may have wondered during this guide how changes you push to GitHub are built, tested and distributed. GitHub Actions are utilised in the community images repoistory for building, testing and publishing new images continuously on new changes. The ``.github`` directory in the community images repository contains all the CI configuration used. The ``pr.yml`` GitHub workflow is the most relevent workflow for our particular use case. Following the upstream guide above, if you made a pull request you'll notice a new workflow being initialised, this workflow will build images relevent to the Ansible modified to ensure your changes do not contain fatal Ansible syntax errors. (Note: This stage of the CI may not always pick up broken changes, such as the case of broken packages).

If your changes were approved and passed the build workflow, you can now merge it into the 'main' branch and new build workflow will be triggered on merging. Following a successful build workflow, the image created will not be deleted as it is in the pull request workflow. To make this image public, it is required to create a GitHub tag, which will trigger the ``tag.yml`` workflow and the manifest for the new images built will be made public for new deployments.
