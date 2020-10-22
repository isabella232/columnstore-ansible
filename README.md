![logo](https://raw.githubusercontent.com/mariadb-corporation/mariadb-community-columnstore-docker/master/MDB-HLogo_RGB.jpg)

## MariaDB Enterprise 10.5.6 / ColumnStore 5.4.1 Cluster

### Prerequisites:

Please install the following applications:

*   [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
*   [Terraform](https://www.terraform.io)

And grab your enterprise token here:

*   [MariaDB Enterprise Token](https://customers.mariadb.com/downloads/token/)

### About:

This automation project will create a 3 node **MariaDB** cluster with the **ColumnStore** engine enabled as well as a **MaxScale** load balancer.

By manually creating an */inventory/hosts* file, you may skip the **Terraform** portion of this tutorial and use the **Ansible** playbook directly to provision your existing machines.

#### Tested On AWS
AMI Name|AMI ID
---|---
CentOS7|ami-0bc06212a56393ee1|
CentOS8|ami-03ef3eebb80538c74|

### Build Instructions:

Open a terminal window and clone the repository:

1.  Visit our [website](https://customers.mariadb.com/downloads/token/) and grab your enterprise token
2.  `git clone https://github.com/mariadb-corporation/columnstore-ansible.git`
3.  `cd` into the newly cloned folder
4.  Edit these files to customize your cluster:
    *   [variables.tf](variables.tf)
    *   [ansible.cfg](ansible.cfg)
    *   [all.yml](/inventory/group_vars/all.yml)
5.  `terraform init`
6.  `terraform apply --auto-approve`
7.  `ansible-playbook provision.yml`

#### MariaDB Connection Info
Node|Username|Password|Mode
---|---|---|---
pm1|admin|DemoPassword1~|Read/Write|
pm2|admin|DemoPassword1~|Read Only|
pm3|admin|DemoPassword1~|Read Only|
mx1|admin|DemoPassword1~|Load Balancer|

## REST-API Instructions

### Format of url endpoints for REST API:

```perl
https://{server}:{port}/cmapi/{version}/{route}/{command}
```

#### Examples urls for available endpoints:

*   `https://<pm1_ip>:8640/cmapi/0.4.0/cluster/status`
*   `https://<pm1_ip>:8640/cmapi/0.4.0/cluster/start`
*   `https://<pm1_ip>:8640/cmapi/0.4.0/cluster/shutdown`
*   `https://<pm1_ip>:8640/cmapi/0.4.0/cluster/add-node`
*   `https://<pm1_ip>:8640/cmapi/0.4.0/cluster/remove-node`

### Request Headers Needed:

*   'x-api-key': 'somekey123'
*   'Content-Type': 'application/json'

*Note: x-api-key can be set to any value of your choice during the first call to the server. Subsequent connections will require this same key*

### Examples using curl:

#### Get Status:
```
curl -s https://<pm1_ip>:8640/cmapi/0.4.0/cluster/status --header 'Content-Type:application/json' --header 'x-api-key:somekey123' -k | jq .
```
#### Start Cluster:
```
curl -s -X PUT https://<pm1_ip>:8640/cmapi/0.4.0/cluster/start --header 'Content-Type:application/json' --header 'x-api-key:somekey123' --data '{"timeout":20}' -k | jq .
```
#### Stop Cluster:
```
curl -s -X PUT https://<pm1_ip>:8640/cmapi/0.4.0/cluster/shutdown --header 'Content-Type:application/json' --header 'x-api-key:somekey123' --data '{"timeout":20}' -k | jq .
```
#### Add Node:
```
curl -s -X PUT https://<pm1_ip>:8640/cmapi/0.4.0/cluster/add-node --header 'Content-Type:application/json' --header 'x-api-key:somekey123' --data '{"timeout":20, "node": "<pm2_ip>"}' -k | jq .
```
#### Remove Node:
```
curl -s -X PUT https://<pm1_ip>:8640/cmapi/0.4.0/cluster/remove-node --header 'Content-Type:application/json' --header 'x-api-key:somekey123' --data '{"timeout":20, "node": "<pm2_ip>"}' -k | jq .
```

## MaxScale GUI Info

*   url: `http://<maxscale_ip>:8989`
*   username: `admin`
*   password: `mariadb`


## Clean Up

*   `terraform destroy --auto-approve`
