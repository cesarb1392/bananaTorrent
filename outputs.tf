#output "jackett_logs" {
#  value = docker_container
#}

output "vpc_server_hostname" {
  value = local.json_data[0].hostname
}
