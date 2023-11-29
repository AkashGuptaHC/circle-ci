pid_file = "./pidfile"
exit_after_auth = true
vault {
  address = "https://e479-103-208-68-174.ngrok-free.app"
  retry {
    num_retries = -1
  }
}
auto_auth {
  method "jwt" {
    exit_on_err = true
    config = {
      role = "circleci-demo"
      path = ".circleci/vault/token.json"
      remove_jwt_after_reading = false
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
