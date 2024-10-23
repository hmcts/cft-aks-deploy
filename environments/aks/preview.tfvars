clusters = {
  "00" = {
    kubernetes_cluster_version = "1.30"
  }

   "01" = {
#     kubernetes_cluster_version = "1.30"
#   }
#}
kubernetes_cluster_ssh_key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+s99FmkHwqdBbbzgw0Q9vqqJb0VkJ+QrmN5elArYOSX5HER+jAooyOEiZNynoL+oYBZT52p6sSVOvvccl06GX1FNfRkC6A8DlAUeIPO56N4/8awfxT1F1ydjMWHgZcZrPZiFUxH/duvlGqtqnO0iQzWKLsXovGFn0xPRAexK0004Ij1igfMZ+PyxQBunawZFo67cSJu3LpHd/fxqGd/qHBQ1iR01NdRjEBIUKh3/0LxIhOB3I0jxadXGQYXwCV1xefhVrHS13dqJH9tNkHB8YbCQ24hiVd2bmxjBPhS767pfByLkzRIFkYX9l5aSIDl3QLOAQruv5F36kMN9OmyXz aks-ssh"
enable_user_system_nodepool_split = true

system_node_pool = {
  vm_size   = "Standard_D4ds_v5",
  min_nodes = 4,
  max_nodes = 6
}

linux_node_pool = {
  "00" = {
    vm_size   = "Standard_D8ds_v5",
    min_nodes = 30,
    max_nodes = 180,
    max_pods  = 60
  },
  "01" = {
    vm_size   = "Standard_D8ds_v5",
    min_nodes = 30,
    max_nodes = 180,
    max_pods  = 30  
  }
}

availability_zones = ["1", "2", "3"]
autoShutdown       = true

node_os_maintenance_window_config = {
  frequency   = "Daily"
  start_time  = "16:00"
  is_prod     = false
}