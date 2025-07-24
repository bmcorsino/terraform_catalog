/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "google_sql_database_instance" "main" {
  name                = var.gcp_cdb_name
  database_version    = var.database_version
  deletion_protection = var.deletion_protection

  settings {
    # Second-generation instance tiers are based on the machine type
    tier = var.tier
  }
}