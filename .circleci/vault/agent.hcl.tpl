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
    type = "approle"
    config = {
      role_id_file_path = "4a1dbb83-7101-226d-98e2-46f2e08c44ed"
      secret_id_file_path = "d51ad787-71ed-d37e-5f96-68536ec06dee"
      remove_secret_id_file_after_reading = false
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
