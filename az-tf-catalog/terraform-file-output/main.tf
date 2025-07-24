resource "null_resource" "output" {
  for_each = local.azurerm_resource_output_map

  provisioner "local-exec" {
    command = "echo \"${yamlencode(each.value)}\" >> ${var.output_file}"
  }

  depends_on   = [var.azurerm_resource_depends_on]
}