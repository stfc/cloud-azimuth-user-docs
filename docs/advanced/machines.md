---
hide:
  - footer
---

!!! Danger
    
    Stopping or deleting machines using this page may cause potentially unrecoverable issues with platforms that they are part of.
    **Do not stop or delete machines here unless you know what you are doing!**

The machines tab allows a subset of the Instance management options available to you in the [OpenStack Web UI (Horizon)](https://openstack.stfc.ac.uk/) to be performed within Azimuth. Machines in your OpenStack Project/Tenancy can be created or managed, within your project quota. This page can also be used to easily check the status of machines deployed as part of platforms.

New machines will have your SSH Key authorized, set using the "SSH Public Key" link on Azimuth's sidebar. Note that changing the key here will not update authorized keys on existing machines.

![Machines Page](../assets/images/machines.png)