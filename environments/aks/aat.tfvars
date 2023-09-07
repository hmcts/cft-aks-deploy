clusters = {
  "00" = {
    kubernetes_cluster_version        = "1.27"
  },
  "01" = {
    kubernetes_cluster_version        = "1.27"
  }
}
kubernetes_cluster_ssh_key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfTT+Bu3rkDptVCj03j8jyflM6bZxNp4tgi0GibRciAops5dOkbtoWKBNpHfGH5AlTKnReRJTlfqM88DjGnYZwYtfx7Kqf3rxNXfwFqXrVYETGy0SNo11WrBSNHDnyfNVm5UFE7HmpSoGVr+C9/OCVmzTDbYoPppGZ79Iv74CLMpsIM8XuD2lQAolODLfA55OTdeJJLgyFu0cEB3ZrrM2DXwMm5CI8C05ACDvDkEO4vtGK9OCYYkxT9/3pskk/ub+IpjuEajryK2fhsPDFwmTVzaMAvM9HIIvDyvfJXjGlGp12d/wubHQ3HlXgUxvU2UF+ggPaaSfQnqALtQ/PwcHf aks-ssh"
enable_user_system_nodepool_split = true
system_node_pool = {
  vm_size   = "Standard_D4ds_v5",
  min_nodes = 4,
  max_nodes = 10
}
linux_node_pool = {
  vm_size   = "Standard_D8ds_v5",
  min_nodes = 30,
  max_nodes = 80
}

availability_zones = ["1", "2", "3"]
autoShutdown       = true
