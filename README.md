A Simple way to deploy AKS and ACR with terraform.
=============================================

Requirements:
* terraform v0.12 or later. Get it at: https://www.terraform.io/downloads.html

* azure cli. Get it at: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macos?view=azure-cli-latest

```
$ git clone https://github.com/antoonhuiskens/aks-terraform.git`
$ cd aks-terraform
$ terraform init
```
This terraform uses a pre-existing SP, given that there are some timeout issues when creating a SP through terraform.

A basic setup requires at least the following variables to be set:

| variable |note|default| description |
|----------|-|-|-------------|
| prefix |required|-|a prefix used for every resource created, so that it's likely unique.|
| ad_app| required|-|the name of a separately created Appreg/SP|
| password|required|-| the secret of the SP|
| linuxuser|required|-| the name of the linuxuser for the k8s nodes|
|mysshkey| required|-|the location of the ssh key on your filesystem for the user of the k8s nodes|

| variable |note|default| description |
|----------|----|-------|-------------|
|k8sversion|-| 1.16| set to the maj.min version to use, i.e. this default will install 1.16.latest |


as an example:

`$ export TF_VAR_prefix=ah`

Alternatively, plan and/or apply with:

 `terraform [plan|apply] -var 'prefix=ah'`

See `terraform plan --help` for more ways of passing in variables. (terraform.tfvars comes to mind)


In order to deploy:

`$ terraform plan -out tfplan && terraform apply tfplan`

Once this completes (I'm seeing around 10-15 minutes typically):

`$ az login`
`$ az aks get-credentials`

In order to destroy:

`$ terraform plan -destroy -out tfplan && terraform apply tfplan`
