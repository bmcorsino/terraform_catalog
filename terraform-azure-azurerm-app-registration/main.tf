resource "azuread_application" "main" {
    display_name                = var.name
    sign_in_audience            = var.sign_in_audience
    owners                      = var.owners
    web {
      redirect_uris = var.reply_urls
    }
    depends_on      = [var.azurerm_resource_depends_on]
}

resource "azuread_service_principal" "main" {
    count                        = var.service_principal ? 1 : 0
    application_id               = azuread_application.main.application_id
    app_role_assignment_required = false
    depends_on = [
      azuread_application.main
    ]
}

resource "azuread_application_password" "main" {
    application_object_id = azuread_application.main.id
    display_name          = var.passwd_description
    end_date              = var.passwd_end_date
    depends_on = [
      azuread_application.main
    ]
    lifecycle {
      ignore_changes = [
        value,
        end_date
      ]
    }
}