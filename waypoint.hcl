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
        image = "registry.registry.svc.cluster.local/jgwhite/smallwins"
        tag   = gitrefpretty()
      }
    }
  }

  deploy {
    use "kubernetes" {}
  }

  release {
    use "kubernetes" {}
  }
}
