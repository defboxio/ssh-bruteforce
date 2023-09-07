terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "= 2.28.0"
    }
  }

  required_version = ">= 1.2.0"
}

variable "do_token" {
    type = string
}

variable "public_key_path" {
    type = string
}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "management_key" {
  name       = "Management ssh key"
  public_key = file(var.public_key_path)
}




resource "digitalocean_droplet" "nameSSH" {
  image  = "ubuntu-22-04-x64"
  name   = "nameSSH"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.management_key.fingerprint]
}

resource "digitalocean_droplet" "attacker" {
  image  = "ubuntu-22-04-x64"
  name   = "nameSSH"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.management_key.fingerprint]
}


output "ssh_bruteforceble" {
  value = digitalocean_droplet.nameSSH.ipv4_address
}


output "attacker" {
  value = digitalocean_droplet.attacker.ipv4_address
}



