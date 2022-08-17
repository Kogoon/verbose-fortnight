# verbose-fortnight
final project - terraform


## Terraform Install 

* Amazon Linux 
``` bash
$ sudo yum install -y yum-utils
$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
$ sudo yum install -y terraform
```

## Terraform usage

``` bash
$ terraform init
$ terraform validate
$ terraform plan
$ terraform apply
$ terraform destroy
```

## Project

``` text
.
├── eks
│   ├── output.tf
│   ├── providers.tf
│   └── variable.tf
├── infra
│   ├── output.tf
│   ├── providers.tf
│   ├── variable.tf
│   └── vpc.tf
├── README.md
└── workspace
    ├── instance.tf
    ├── output.tf
    ├── providers.tf
    └── variable.tf
```