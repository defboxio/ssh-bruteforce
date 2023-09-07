
in folder sample_keys/
`ssh-keygen -t ed25519 -C "test@testov.example.com"`

terraform.tfvars: 

```terraform
do_token = "your_token"
public_key_path = "path/to/public/key"
```

Run this when you ready
```shell   
terraform apply
terraform output ssh_bruteforceble
```
