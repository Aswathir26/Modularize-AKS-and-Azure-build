# Modularize-AKS-and-Azure-build

**Introduction

A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module. When you run Terraform commands directly from such a directory, it is considered the root module. So in this sense, every Terraform configuration is part of a module.

Here we created two directories one main directory and other directory for modularizing. The directory structure is given below.

Build_infra

 - inputs.tf

 - main.tf

 - provider.tf

Modules

->cluster(sub directory)

 - cluster.tf

 - outputs.tf

 - variables.tf

->network (sub directory)

 - network.tf

 - variables.tf

->mysql(sub directory)

 - mysql.tf

 - variables.tf

**Build and Test

Commands:

      $ git clone https://github.com/Aswathir26/Modularize-AKS-and-Azure-build
      $ cd Build_infra
      $ az login
      $ az account set --subscription <subscription id>
      $ terraform init
      $ terraform workspace new test
      $ terraform workspace new dev
      $ terraform plan
      $ terraform apply (inorder to initialize and apply the code)
