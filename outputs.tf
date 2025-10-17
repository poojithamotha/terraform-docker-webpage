output "container_name" {
  description = "Name of the created docker container"
  value       = docker_container.web.name
}

output "host_url" {
  description = "URL to access the web page"
  value       = "http://localhost:${var.port}"
}
