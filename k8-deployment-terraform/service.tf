resource "kubernetes_service_v1" "my-app-svc" {
  metadata {
    name = "my-app-1-svc"
    namespace = kubernetes_namespace_v1.ns.id
  }
  spec {
    selector = {
    #   app = kubernetes_pod.example.metadata.0.labels.app
      app = kubernetes_deployment_v1.my-app-1.spec.0.selector.0.match_labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

# output "lb_out_put" {
#   value = kubernetes_service_v1.my-app-svc.spec
# }
