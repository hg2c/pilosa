data-dir = "${DATA_DIR}"
bind = "node0.pilosa.com:10101"

[gossip]
  port = 12000
  seeds = ["node0.pilosa.com:12000"]

[cluster]
  replicas = 1
  coordinator = ${IS_COORDINATOR}