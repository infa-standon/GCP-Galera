
variable "name" {
  default = "CT_galera-node"
}

variable "cluster_size" {
  default = "3"
}

variable "disk" {
  default = "galera-disk"
}

variable "size" {
  default = 100
}

variable "zone" {
  default = "us-west1-a"
}

variable "ssh_key" {
  default = "xxxxxxx"
}

variable "ssh_user" {
  default = "centos"
}

variable "labels" {
  type = "map"
  default = {
    APPLICATIONROLE = "SERVER"
    APPLICATIONENV  = "NONPROD"
    BUSINESSUNIT    = "CLOUDTRUST"
    ALERTGROUP      = "CT_DB_TEAM"
  }
}
