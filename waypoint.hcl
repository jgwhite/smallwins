project = "smallwins"

runner {
  enabled = true

  data_source "git" {
    url = "https://github.com/jgwhite/smallwins.git"
    ref = "main"
  }
}

app "website" {
  build {
    use "docker" {}

    registry {
      use "docker" {
        image = "797645259670.dkr.ecr.eu-west-3.amazonaws.com/jamie-dev/smallwins"
        tag   = gitrefpretty()
      }
    }
  }

  deploy {
    use "kubernetes" {}
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
