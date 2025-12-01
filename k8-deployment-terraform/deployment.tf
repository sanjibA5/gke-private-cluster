resource "kubernetes_deployment_v1" "my-app-1" {
  metadata {
    name      = "my-app-1"
    namespace = kubernetes_namespace_v1.ns.id
    labels = {
      app = "myapp1"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "myapp1"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp1"
        }
      }

      spec {
        container {
          image = "ghcr.io/stacksimplify/kubenginx:1.0.0"
          name  = "my-app-container-1"
          port {
            container_port = 80
          }
          resources {
            requests = {
              memory = "5Mi"
              cpu = "25m"
            }
            limits = {
              memory = "50Mi"
              cpu = "50m"
              
            }
          }


          liveness_probe {
            http_get {

              port = 80


            }

          }
        }
      }
    }
  }
}