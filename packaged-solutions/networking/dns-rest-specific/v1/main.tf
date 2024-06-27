/******************************************
  Cloud DNS - Internal googleapis
 *****************************************/

resource "google_dns_managed_zone" "googleapis_zone" {
  project     = var.project_id
  name        = "googleapis-zone-${random_string.random_string_for_api_zone.result}"
  dns_name    = "googleapis.com."
  description = "Google API Access"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  var.network_self_link
    }
  }
}

resource "random_string" "random_string_for_api_zone" {
  length  = 4
  lower   = true
  upper   = false
  special = false
  numeric = true
}

module "restricted_api_endpoints_dns_googleapis" {
  source = "./specific-entries"
  project_id = var.project_id
  dns_zone_name = google_dns_managed_zone.googleapis_zone.name
  projected_api_endpoints = var.restricted_api_list
}

resource "google_dns_record_set" "restricted_api_access_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.googleapis_zone.name
  name          = "restricted.googleapis.com."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

/******************************************
  Cloud DNS - Internal - Star
 *****************************************/

module "restricted_api_endpoints_dns_other" {
  source            = "./star-entries"
  project_id        = var.project_id
  dns_zone_name     = google_dns_managed_zone.googleapis_zone.name
  endpoint_list     = var.other_dns_endpoints_list
  network_self_link = var.network_self_link
}