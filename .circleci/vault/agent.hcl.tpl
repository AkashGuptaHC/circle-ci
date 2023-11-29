pid_file = "./pidfile"
exit_after_auth = true
vault {
  address = "http://192.168.73.3:8200"
  retry {
    num_retries = -1
  }
}
auto_auth {
  method {
    type = "token_file"
    config = {
      path = ".circleci/vault/.vault-token"
    }
  }
  sink "file" {
    config = {
      path = "/tmp/vault-token"
    }
  }
}
template_config {
  exit_on_retry_failure = true
}
template {
  source      = ".circleci/vault/secrets.ctmpl"
  destination = ".circleci/vault/setenv"
}
