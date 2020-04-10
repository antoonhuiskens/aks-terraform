# A Simple way to deploy AKS and ACR with terraform.


## Requirements:
* terraform v0.12 or later. Get it at: https://www.terraform.io/downloads.html

* azure cli. Get it at: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macos?view=azure-cli-latest

```
$ az login
$ git clone https://github.com/antoonhuiskens/aks-terraform.git`
$ cd aks-terraform
$ terraform init
```

## important
This terraform uses a pre-existing SP, given that there are some timeout issues when creating a SP through terraform.
In short: Create an app registration, add the service principal, create a secret and keep it safe. Use the secret as a value for the password value below.
Another way would be to deploy an aks from the azure portal, and copy all the properties in the generated SP.

A basic setup requires at least the following variables to be set:

| variable |note|default| description |
|----------|----|-------|-------------|
| prefix |required|-|a prefix used for every resource created, so that it's likely unique.|
| ad_app| required|-|the name of a separately created Appreg/SP|
| password|required|-| the secret of the SP|
| linuxuser|required|-| the name of the linuxuser for the k8s nodes|
|mysshkey| required|-|the location of the ssh key on your filesystem for the user of the k8s nodes|

Notable variables:
------------------
| variable |note|default| description |
|----------|----|-------|-------------|
|k8sversion|-| 1.16| set to the maj.min version to use, i.e. this default will install 1.16.latest |


as an example:

`$ export TF_VAR_prefix=ah`

Alternatively, plan and/or apply with:

 `terraform [plan|apply] -var 'prefix=ah'`

See `terraform plan --help` for more ways of passing in variables. (terraform.tfvars comes to mind, which is what I'm actually using)


In order to deploy:

```
$ terraform plan -out plan && terraform apply plan
```

Once this completes (I'm seeing around 10-15 minutes typically), terraform reports the outputs defined:

* kubeconfig - the kubeconfig file
* acr_host - the hostname for the azure container registry
*
* rg - name of the main resource group


```
# Get some info on your cluster  (set the prefix yourself ...)
$ az aks list -g $({terraform output rg) -o table
# To download and merge the kubeconfig:
$ az aks get-credentials -n ${prefix}-aks-cluster -g $(terraform output rg)
```

In order to destroy:

```
$ terraform plan -destroy -out plan && terraform apply plan
```
