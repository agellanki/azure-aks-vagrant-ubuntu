
# azure-aks-vagrant-ubuntu
![enter image description here](https://lh3.googleusercontent.com/W2lLCPUVHg5eUmcrpB3RrxGR_esVx1t4LH4M6NofUaDN7yR0QL_c7tAa-Y2vzNnRd8i9PXLCSKDSOA)
## About...

This setup is used to install ***pre-requisites*** that are required to access  ***Azure Kubernetes Service***.

## Table of Contents

* [What are the pre-requisites ?](#pre-requisites)
* [How to install azure-cli ?](#deploy)
* [What are the add-ons provided ?](#addons)
* [What are the VM configuration details ?](#configuration)
* [How to access existing AKS cluster ?](#aks)
* [How to access Kubernetes Dashboard ?](#access_dashboard)
* [How to access Vagrant VM ?](#access)
* [How to stop Vagrant VM ?](#stop)
* [How to restart Vagrant VM ?](#restart)
* [How to destroy Vagrant VM ?](#destroy)



<a id="pre-requisites"></a>
## What are the pre-Requisites ?
* [Git](https://git-scm.com/downloads "Git")
* [Vagrant](https://www.vagrantup.com/downloads.html "Vagrant")
* [Oracle Virtual Manger](https://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html "Oracle Virtual Manger")
* `Virtualization needes to be enabled in System BIOS`
* `Minimum laptop/desktop configuration  - 2GB RAM,2 CPU`


<a id="deploy"></a>
## How to install azure-cli
* Open `bash` terminal 
* Checkout the code  (git clone https://github.com/SubhakarKotta/azure-aks-vagrant-ubuntu.git) 
* `cd azure-aks-vagrant-ubuntu/provisioning` 
* Default settings:`env.yaml`.
```yaml
VM:
  ip: 100.10.10.112
  cpus: 2
  memory: 2048
  vmname: azure-aks-ubuntu
  hostname: azure-aks-ubuntu.com
```
    
By running the below command ***azure-cli*** will be installed to access ***Azure Kubernetes Service*** .
	
* `vagrant up`



<a id="addons"></a>
## What are the add-ons provided ?
* `kubectl`
* `az`
* `helm`



<a id="configuration"></a>
## What are the VM configuration details ?

Name|IP|OS|RAM|CPU|
|----|----|----|----|----|
azure-aks-ubuntu  |100.10.10.112|Ubuntu 18.04|2G|2|



<a id="aks"></a>
## How to access existing AKS Cluster ?

* `$ cd azure-aks-vagrant-ubuntu/provisioning`
* `$ vagrant ssh azure-aks-ubuntu`
* `$ az login --username <YOUR_NAME> --password <YOUR_PASSWORD>`
* `$ az aks get-credentials --resource-group <YOUR_RESOURCE_GROUP_NAME> --name <YOUR_CLUSTER_NAME>`
* `$ kubectl get nodes` [To verify kubectl is connected to aks cluster]



<a id="access_dashboard"></a>
## How to access Kubernetes Dashboard ?

From ***local*** system execute the below commands

* `$ ssh -L 8001:localhost:8001 vagrant@100.10.10.112` [***password : vagrant***]
* `$ kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode`

By running the above command a **secret token** will be generated which can be used to login to the Kubernetes Dashboard.

* `$ kubectl proxy`

***Go to browser***
[http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/login](http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/login)



<a id="access"></a>
## How to access Vagrant VM ?
The Vagrant VM can be accessed in ***three*** ways

***GUI***
* `100.10.10.112` [***vagrant/vagrant***]


***vagrant ssh***
* `$ cd azure-aks-vagrant-ubuntu/provisioning`
* `$ vagrant ssh azure-aks-ubuntu`

***putty***
* `100.10.10.112` [***vagrant/vagrant***]
	

    
<a id="stop"></a>
## How to stop Vagrant VM ?
* `$ cd azure-aks-vagrant-ubuntu/provisioning`
* `$ vagrant halt`



<a id="restart"></a>
## How to restart Vagrant VM ?
* `$ cd azure-aks-vagrant-ubuntu/provisioning`
* `$ vagrant up`


<a id="destroy"></a>
## How to destroy Vagrant VM ?
* `$ cd azure-aks-vagrant-ubuntu/provisioning`
* `$ vagrant destroy`