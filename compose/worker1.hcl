disable_mlock = true

listener "tcp" {
	address = "worker1"
	purpose = "proxy"
	tls_disable = true
}

worker {
  name = "worker1"
  description = "A worker for a docker demo"
  address     = "worker1"
  public_addr = "localhost"
  controllers = ["boundary"]
  tags {
    region    = ["us-east-1"],
    type      = ["prod", "database", "postgres"]
  }
}

kms "aead" {
  purpose = "worker-auth"
  aead_type = "aes-gcm"
  key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
  key_id = "global_worker-auth"
}