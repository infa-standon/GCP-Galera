variable "name" {
    default="galera-node-3"
  }

  variable "disk_name" {
    default = "galera-disk-3"
  }

variable "size" {
    default=100

}

variable "zone" {
default="us-east4-a"
}

variable "ssh_key" {
  default = "file_path"
}

variable "ssh_user" {
  default = "centos"
}
