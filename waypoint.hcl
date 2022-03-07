project = "smallwins"

runner {
  enabled = true

  data_source "git" {
    url = "https://github.com/jgwhite/smallwins.git"
    ref = "main"
  }
}

variable "registry_username" {
  type    = string
  default = ""
}

variable "registry_password" {
  type    = string
  default = ""
}

app "website" {
  build {
    use "docker" {
      buildkit = false
    }

    registry {
      use "docker" {
        image    = "jgwhite/smallwins"
        tag      = gitrefpretty()
        local    = false
        username = var.registry_username
        password = var.registry_password
      }
    }
  }

  deploy {
    use "kubernetes" {
      cpu {
        request = "250m"
        limit   = "500m"
      }

      autoscale {
        min_replicas = 1
        max_replicas = 5
        cpu_percent  = 75
      }
    }
  }

  release {
    use "kubernetes" {
      ingress "http" {
        annotations = {
          "kubernetes.io/ingress.class" = "nginx"
          "cert-manager.io/issuer"      = "letsencrypt-prod"
        }
        host = "smallwins.club"
        tls {
          hosts       = ["smallwins.club"]
          secret_name = "smallwins-club-tls"
        }
      }
    }
  }
}
