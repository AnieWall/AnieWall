# Week 3 - Virtual Machines on Cloud Platforms

## W3.1 - Jetstream2 Virtual Machine

An Ubuntu virtual machine was created on Jetstream2 using the OpenStack command-line interface from Git Bash on Windows.

### Configuration

| Item | Value |
| --- | --- |
| Platform | Jetstream2 |
| Image | Featured-Minimal-Ubuntu24 |
| Flavor | m3.tiny |
| vCPUs | 1 |
| RAM | 3072 MB |
| Disk | 20 GB |
| VM name | swallace1-vm-1 |
| SSH key | swallace1 |
| Security group | remotelogin |
| Login user | ubuntu |

The existing ED25519 SSH key was first verified through GitHub. The public key was then imported into Jetstream Horizon, and an application credential was created for command-line access.

The OpenStack client was installed in a Python virtual environment on the Windows host. The downloaded `clouds.yaml` credential file was stored under `~/.config/openstack/`, and the OpenStack CLI was used to verify access to Jetstream resources.

The VM was created using the Ubuntu 24.04 minimal image and the smallest available flavor suitable for the exercise. The `remotelogin` security group was used to permit remote SSH access.

After the VM became active, a floating IP address was allocated and SSH access was established successfully.

### Verification

Inside the remote VM, the following commands were executed:

```bash
whoami
hostname
uname -a
```
The output confirmed that the login user was `ubuntu`, the hostname was `swallace1-vm-1`, and the system was running Ubuntu 24.04 Linux.

### Proof of Successful Login

![Jetstream2 VM login](jetstream.png)

### Resource Cleanup

After successful verification and documentation, the Jetstream2 virtual machine was deleted and the temporary floating IP address was released. This ensured that cloud resources were not left allocated after completion of the exercise.


## W3.2 - Chameleon Cloud Virtual Machine

An Ubuntu 24.04 virtual machine was created on Chameleon Cloud using the KVM@TACC testbed.

### Configuration

| Item | Value |
|---|---|
| Platform | Chameleon Cloud KVM@TACC |
| Project | CH-817419 |
| Image | CC-Ubuntu24.04 |
| Flavor | Reserved m1.small |
| vCPUs | 1 |
| RAM | 2 GB |
| Disk | 20 GB |
| VM name | swallace6-chameleon-vm |
| SSH key | swallace6 |
| Network | sharednet1 |
| Security group | swallace6-ssh |

A one-hour lease was created before launching the instance. A public floating IP address was associated with the VM, and an SSH security rule permitting TCP port 22 was attached through a dedicated security group.

### Verification

Inside the remote VM, the following commands were executed:

```bash
whoami
hostname
uname -a
```

The output confirmed that the login user was cc, the hostname was swallace6-chameleon-vm, and the system was running Linux on the x86_64 architecture.

### Resource Cleanup

After successful verification and documentation, the Chameleon Cloud virtual machine was removed. The temporary floating IP address, SSH security group, and one-hour lease were also released or expired. This confirmed that no temporary compute or network resources remained allocated after completion of the exercise.


## W3.4 - Comparing VM Creation

The three environments provided different approaches to creating and managing virtual machines.

| Area | Local VM - Hyper-V | Jetstream2 | Chameleon Cloud |
|---|---|---|---|
| Infrastructure | Runs on the local Windows computer | Runs on remote Jetstream2 cloud infrastructure | Runs on remote Chameleon KVM@TACC infrastructure |
| VM Setup | Created through Hyper-V using local hardware resources | Created through OpenStack using a cloud image and flavor | Required a lease reservation before the VM could be launched |
| SSH Access | Direct local access was available through the host system | Required an SSH key, security group, and floating IP | Required an SSH key, floating IP, and SSH security group |
| Resource Selection | CPU, memory, disk, and networking were configured locally | A predefined cloud flavor was selected | A cloud flavor was reserved for a limited period |
| Networking | Managed through Hyper-V virtual networking | Used OpenStack networking and a floating IP | Used `sharednet1` together with a public floating IP |
| Resource Usage | Consumed the laptop's own RAM, storage, and CPU | Cloud resources were used instead of local hardware | Cloud resources were reserved temporarily and released after use |
| Cleanup | The VM can remain stored locally until manually removed | The cloud VM and temporary floating IP were deleted after verification | The VM, floating IP, security group, and lease were released after verification |

### Comparison

The local Hyper-V environment was convenient because the VM remained under direct control of the host computer and did not require an Internet-based cloud account or resource reservation. However, the VM depended on the laptop's available memory, storage, and processor capacity.

Jetstream2 moved the computing workload away from the local machine and introduced cloud concepts such as images, flavors, security groups, SSH keys, and floating IP addresses. Once the OpenStack command-line environment was configured, the VM could be created and managed remotely.

Chameleon Cloud followed a similar OpenStack model but required more advance planning because compute resources had to be reserved through a time-limited lease. The reservation, dedicated SSH security group, floating IP, and cleanup process made resource management more explicit.

Overall, the three environments demonstrated the progression from locally managed virtualization to remotely provisioned cloud infrastructure. The local VM provided direct control, while Jetstream2 and Chameleon Cloud provided remote infrastructure with additional networking, authentication, resource-allocation, and cleanup requirements.
