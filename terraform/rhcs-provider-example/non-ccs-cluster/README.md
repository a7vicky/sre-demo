# Non-CCS cluster creation example

``` shell
terraform init
terraform plan -var-file=${HOME}/.config/ocm/ocm.json
terraform apply -var-file=${HOME}/.config/ocm/ocm.json
```
