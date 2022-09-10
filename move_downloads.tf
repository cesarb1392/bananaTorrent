
resource "local_file" "move_downloads" {
  content = templatefile(
    "${path.module}/templates/move_downloads.tpl",
    {
      source = "/downloads/complete/"
      target = "/downloads/"
    }
  )
  filename = "${path.module}/templates/move_downloads.sh"
  #  directory_permission = "0755"
  #  file_permission      = "0644"
}

resource "docker_container" "move_downloads" {
  count = local.enable_transmission ? 1 : 0

  image      = docker_image.move_downloads.latest
  name       = "move_downloads"
  entrypoint = ["/usr/local/bin/move_downloads.sh"]

  volumes {
    host_path      = var.DOWNLOADS_PATH
    container_path = "/downloads"
  }
  volumes {
    host_path      = "${abspath(path.root)}/move_downloads.sh"
    container_path = "/usr/local/bin/move_downloads.sh"
  }

  depends_on = [local_file.move_downloads]

}