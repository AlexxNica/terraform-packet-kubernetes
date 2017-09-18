provider "kubernetes" {
  config_path = "${module.bootkube.user-kubeconfig}"
  config_context = "test-context"
}

resource "kubernetes_config_map" "kube_dns" {
  metadata {
    name = "kube-dns"
    namespace = "kube-system"
  }

  data {
    upstreamNameservers = <<EOF
["8.8.8.8", "8.8.4.4"]
EOF
  }
}
