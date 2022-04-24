# How to


## Preparation

* This tutorial presumes usage of the BASH shell. If you are running Windows, [set up a WSL2 environment](https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10).
* [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Install terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

* Clone this repo:
```
git clone https://github.com/mcree/oe-soc.git
cd oe-soc
```

* Obtain your personal openstack RC file from [here](https://cloud.hbit.sztaki.hu/project/api_access/openrc/)
  * save the file as ```oetest-openrc.sh``` in the current directory
  * alternatively you can edit [versions.tf](versions.tf) to include your credentials as [described here](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs)

* Install terraform requirements:
```
terraform init
```

## Create stack

* Make sure your environment is set up:
```
source oetest-openrc.sh
```

* Edit [00-locals.tf](00-locals.tf) to suit your needs

* Create the environment:
```
terraform apply
```

* Wait
* Wait
* And wait a bit more as Kali packages are installed on the first boot
* Check for public IP addresses on the openstack console or with ```openstack server list``` (you'll need [openstack-client](https://docs.openstack.org/newton/user-guide/common/cli-install-openstack-command-line-clients.html) for this to work)

## Use the stack

### Shell access

* User SSH keys are defined in [00-locals.tf](00-locals.tf)
* User name is ```debian```

### Graphical desktop

* Install [x2go client](https://wiki.x2go.org/doku.php/download:start)
* Set up a session to use your ssh key, user name ```debian``` and desktop type ```LXDE```

## Delete stack

```
terraform destroy
```
