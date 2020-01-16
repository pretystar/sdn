# SDN

A playground to experiment on software defined networks.

## Prerequisites

- VirtualBox

    We would need a hypervisor to host virtual machines for network connectivity experiments. VirtualBox is by far the most widely supported one on various OSes.

    ```
    choco install virtualbox
    ```

- Vagrant

    Vagrant shines with its ability to map infrastructure as code, on a development machine. With its large image category, it practically turns your laptop into a simple computing cloud.

    ```
    choco install vagrant
    ```

    It is advised to download necessary images up front. So for this playground:

    ```
    vagrant box add ubuntu/bionic64 --provider virtualbox
    ```

    As of this writing the latest version of Vagrant (2.2.6) doesn't support the latest version of VirtualBox (6.1.0) as its provider. A possible workaround would be to modify/create the following files:

    ```
    /c/HashiCorp/Vagrant/embedded/gems/2.2.6/gems/vagrant-2.2.6/plugins/providers/virtualbox/driver/meta.rb
    /c/HashiCorp/Vagrant/embedded/gems/2.2.6/gems/vagrant-2.2.6/plugins/providers/virtualbox/driver/version_6_1.rb
    /c/HashiCorp/Vagrant/embedded/gems/2.2.6/gems/vagrant-2.2.6/plugins/providers/virtualbox/plugin.rb
    ```

    The idea resembles how 5.1.0 is supported by inheriting code from 5.0.0. This suffices for the purpose of this playground. However, it is by no means to say 6.1.0 is fully supported in this manner.

## Why this playground should be of any interest

If you would like to explore the networking part of trending technologies nowadays, stuff like containers, Kubernetes, this should serve as a proper start.

## What is happening here

We aim to illustrate how network resources are separated with namespaces, and how these network namespaces are connected with various technologies.

## How the code should be used

```
vagrant up
```
