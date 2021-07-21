# Training program

## Table of Contents

* [Introduction](#introduction)
* [Theoretical Section](#theoretical-section)
* [Practical Section](#practical-section)
* [Conclusion](#conclusion)

## Introduction

This document outlines the training steps to become a System Administrator. The training will be split into theoretical
and practical sections under the form of an extended project that will cover the different facets of fundamental notions
in order to get acquainted and master them.

The Training program helps to introduce its followers with :

* **Linux**
* **Shell Scripting**
* **DevOps**
* **Cloud Environment**
* **Web Architecture**
* **Virtualization**
* **Continuous Integration/ Continuous Deployment** _(CI/CD)_
* **Code Versioning**
* **Architecture Design**
* **Documentation**
* **Logging and log monitoring**
* **Troubleshooting and debugging**
* **Best Practices**

At the end of this program, it is expected to have an application that is **containerized**, deployed inside of a 
**Kubernetes Cluster _(for the production environment)_** as well as inside of a **Docker Compose** environment
**_(for the pre-production environment)_** that extend across multiple **Linux** devices. The code delivery is to be automated
through the use of **Gitlab CI/CD**. The Application is to use multiple types of databases (Mongodb, Mariadb, Redis, and
Elasticsearch) as well as a distributed **S3** environment for storage.

The source code of the application will be provided with this training guide. It is also worth mentioning that since
your background is in development, it is highly encouraged and, at a certain level of expertise, expected that you
intervene at the code level to fix bugs and/or ameliorate the code in order for it to become cloud native.

## Theoretical section

In order to be effective and well based, there are certain theoretical notions that you must be familiar with and
comprehend. Mastery of these notions is not required. Mastery comes with practice and experience. With that being said,
when the day comes and you need to further explore these concepts in-depth, you need to be able to reference them
directly and pinpoint the exact notion that you need as well as its relation to others.

### Linux

With linux, you need to be able to : _Navigate_ between different directories using relative and absolute paths; 
_Create, copy, move_, and _replace_ files and directories; Edit files; Add and remove users; Attribute _access_ to
users; _Restrict_ and/or _Grant access_ to certain files or directories for certain users; _Remotely connect_ to other
devices and administer them; _Enable and Restrict connections_ through different ports of the machine; _Install_ missing
packages; Etc.

In order to be able perform the aforementioned operations, you need to get familiar with :

* The command line
* Access permissions
* Users, user groups, and privileges
* Storage
* Security and best practices
* The file system
* Firewalls and networking
* The difference between linux distributions
* Repositories as well as package installation
* Remote system administration
* Remote file transfer

References :

* [Intro to Linux that contains an explanation on the different distributions](https://ledumjg.medium.com/get-started-with-linux-a-beginners-guide-9ba69b8be53c)
* [Basic Linux commands](https://linuxize.com/post/basic-linux-commands/)
* [Environment variables under Linux](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)
* [Navigating between folders under Linux](https://linuxize.com/post/linux-cd-command/)
* [Listing files under Linux](https://linuxize.com/post/how-to-list-files-in-linux-using-the-ls-command/)
* [Copying files under Linux](https://linuxize.com/post/cp-command-in-linux/)
* [Moving files under Linux](https://linuxize.com/post/how-to-move-files-in-linux-with-mv-command/)
* [Linux access permissions 1](https://www.pluralsight.com/blog/it-ops/linux-file-permissions)
* [Linux access permissions 2](https://linuxize.com/post/chmod-command-in-linux/)
* [Linux file ownership](https://linuxize.com/post/linux-chown-command/)
* [Pipes and piping under Linux](https://www.geeksforgeeks.org/piping-in-unix-or-linux/)
* [Finding text in files under Linux](https://linuxize.com/post/how-to-use-grep-command-to-search-files-in-linux/)
* [Introduction to regular expression (regex)](https://medium.com/factory-mind/regex-tutorial-a-simple-cheatsheet-by-examples-649dc1c3f285)
* [Firewall configuration under Debian Linux using UFW](https://linuxize.com/post/how-to-setup-a-firewall-with-ufw-on-ubuntu-18-04/)
* [Firewall configuration under Redhat Linux using FirewallD](https://linuxize.com/post/how-to-setup-a-firewall-with-firewalld-on-centos-7/)
* [Installing packages under Debian Linux](https://linuxize.com/post/how-to-use-apt-command/)
* [Adding repositories under Debian Linux](https://linuxize.com/post/how-to-add-apt-repository-in-ubuntu/)
* [Enabling SSH on Ubuntu](https://linuxize.com/post/how-to-enable-ssh-on-ubuntu-18-04/)
* [Copying files over SSH under Linux](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/)
* [Dumping TCP packages under Linux](https://linuxize.com/post/tcpdump-command-in-linux/)
* [File editing using NANO under Linux](https://linuxize.com/post/how-to-use-nano-text-editor/)
* [File editing using VIM under Linux](https://linuxize.com/tags/vim/)
* [Bash tutorial](https://linuxize.com/tags/bash/)

### Architectures

When it comes to architectures, you need to be familiar with the following :

* 1 tier architectures
* 2 tier architectures
* N tier architectures
* Service Oriented Architectures (SOA)
* Micro services architectures
* Multi Site architectures

The purpose of this section is to be familiar with the different types of deployment architectures, their evolution and
the use cases for each.

References:

* [N-tier architectures](https://www.guru99.com/n-tier-architecture-system-concepts-tips.html)
* [Software architecture basics](https://www.educative.io/blog/how-to-design-a-web-application-software-architecture-101)
* [Architectures](https://www.tutorialspoint.com/software_architecture_design/distributed_architecture.htm)
* [Service oriented architectures](https://www.tutorialspoint.com/soa/index.htm)


### Authentication

You need to get familiar with the different types of authentications, especially Basic Authentication and JWT
Authentication. After which, you need to have an in-depth familiarity with _Role-Based Access Control (RBAC)_ and how to
define roles and groups. It is also preferable to have knowledge about _OpenID Connect_ and _OAuth 2.0_, and _SAML_
authentication systems.

### Protocols and connection types

You need to have a basic understanding of the _HTTP_ protocol, _REST_ connections, _Socket/Web Socket_ connections as
well as the difference between _synchronous (sync)_ and _asynchronous (async)_ connections between servers and clients (
or servers to servers).

### Gateways and proxies

You need to be familiar with Gateways, Reverse Proxies, Load Balancing, and application layer routing for incoming
traffic.

### Virtualization

For the virtualization section, you need to understand the difference between _Virtualization_ and _Emulation_ as well
as the difference between _Virtual Machines_ and _Containers_. This is a simple introduction to the concept but very
helpful to understand the distinction between the terms.

After being introduced to the aforementioned concepts, you need to further explore Containers and Containerization
with _Docker_. For which, you need to explore the following concepts of the docker ecosystem:

* Docker images
* Docker tags
* Docker registries
* Docker image inheritance and hierarchy
* Environment variables
* Volumes and Volume Binding
* Networking and the difference between Private and Public networks
* Docker multi-stage images

References :

* [Docker Basics tutorial](https://docker-curriculum.com/)
* [Docker for beginners](https://www.guru99.com/docker-tutorial.html)
* [Docker images](https://jfrog.com/knowledge-base/a-beginners-guide-to-understanding-and-building-docker-images/#:~:text=A%20Docker%20image%20is%20a,publicly%20with%20other%20Docker%20users.)
* [Docker tags](https://www.freecodecamp.org/news/an-introduction-to-docker-tags-9b5395636c2a/)
* [Docker arguments (ARG) and environment variables (ENV)](https://vsupalov.com/docker-arg-env-variable-guide/)
* [Docker image inheritance and hierarchy](https://dzone.com/articles/docker-image-building-blocks#:~:text=The%20most%20common%20scenario%20is,packaged%20in%20the%20inherited%20image.)
* [Networking in Docker](https://docs.docker.com/engine/tutorials/networkingcontainers/#:~:text=Docker%20networking%20allows%20you%20to,and%20try%20the%20ping%20command.)
* [Port mapping in Docker](https://docs.docker.com/config/containers/container-networking/)
* [Docker volumes](https://docs.docker.com/storage/volumes/)

### Code versioning and CI/CD

You need to be familiar with the basics of code versioning tool _Git_ as well as the concept and the utility of the 
_Continuous Integration/Continuous Deployment (CI/CD)_. The tools that you will be using all along your training are
Gitlab for code versioning and Gitlab CI/CD for the Continuous Integration and Continuous Deployment.


### Deployment and Container orchestration

For your final theoretical concept, you need to be familiar with different deployment architectures be it classical (
mono server), multi-site deployments, and deployments using container orchestration tools through the use of the
following two technologies :

* Docker compose
* Kubernetes

## Practical section

In the practical section of the training program, you will be required to complete a series of exercises that will help
you apply the knowledge acquired in the previous section. (Follow the links for more details on the tasks to perform)

1. Your first exercise will focus on the Linux System Administration part of the training as it is the basis of a system
   administrator’s skills.
   - [Section 1 :](exercices/ex1-section-1.md) You will be asked to provide a series of commands that perform a particular series of tasks (to be disclosed later
      on)
   - [Section 2 :](exercices/ex1-section-2.md) After validating your first exercise, you will be asked to convert the series of tasks into an executable script.
2. Your next task, will revolve around application runtime, containerization, and CI/CD
    - [Section 1 :](exercices/ex2-section-1.md) you will be asked to clone a git repository, and start a series of applications.
    - [Section 2 :](exercices/ex2-section-2.md) After starting the applications, you will be asked to containerize them
    - [Section 3 :](exercices/ex2-section-3.md) After the containerization, you will be asked to automate the building and delivery of the images through the use
       of Gitlab CI/CD
3. After mastering application runtime, containerization, and CI/CD, you will be configuring deployments for the
   applications
    - [Section 1 :](exercices/ex3-section-1.md) You will start by creating a docker compose deployment configuration for the application suite
    - [Section 2 :](exercices/ex3-section-2.md) Next, you will be configuring gateway for the application
    - [Section 3 :](exercices/ex3-section-3.md) Furthermore, you will be creating a Kubernetes deployment configuration for the application suite
    - [Section 4 :](exercices/ex3-section-4.md) Lastly, you need to document all your actions, code, and configurations.
4. Your last task will revolve around the following :
    - [Section 1 :](exercices/ex4-section-1.md) Creating a script that initializes a Kubernetes cluster on different machines
    - [Section 2 :](exercices/ex4-section-2.md) Configuring auto deployment of different environments of the application suite into the previously created
        Kubernetes clusters
    - [Section 3 :](exercices/ex4-section-3.md) Configuring S3 storage on the machines
    - [Section 4 :](exercices/ex4-section-4.md) Configuring automated backups of sensitive data
    - [Section 5 :](exercices/ex4-section-5.md) Deploying and configuring tools that will help you ingest logs from these clusters as well as monitoring the
        health of the deployed applications

Please refer to [the outline document](exercices/outlines.md) before you start working.       

## Conclusion

The follow-up of and feedback about your progress will be conducted on task by task basis. A task will be considered 
_“done”_ when it fulfills its intended purpose and it satisfies the quality requirements of your mentor. With that in
mind, please take your time with each task and don’t jump steps. The order of the tasks, be it theoretical or practical,
is as such for a reason.

It should be noted that further tasks might be added along the way, depending on your progress, to help you better
explore a system, a technology, or an architecture or to increase the level of challenge in order to help you become
familiar with even more things.

Whilst the required tasks are few in numbers and might seem benign in the beginning, they are the basis of 90% of the
work of a system administrator/devops specialist. Getting them right is not evident and mastering them all is no easy
feat. Also, whilst this training program does not cover all facets and aspects of the work of a System Administrator, it
helps you acquire fundamentals and apply them. In reality, tools change all the time and it is hard to be always up to
date with all the new tools and technologies. What differentiates a good engineer from another is the comprehension of
the basics as well as their pragmatism and rationale behind their decision.

<p style="text-align: right">
Best of luck.</p>

