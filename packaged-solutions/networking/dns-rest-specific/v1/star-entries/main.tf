/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/******************************************
  DNS
 *****************************************/

locals {
  endpoint_map = toset(var.endpoint_list)
}

resource "google_dns_managed_zone" "restricted_zone" {
  for_each    = local.endpoint_map
  project     = var.project_id
  name        = "restricted-zone-${each.value}-${random_string.random_string.result}"
  dns_name    = "${each.value}."
  description = "Google Restricted API Access - ${each.value} "
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  var.network_self_link
    }
  }
}

resource "google_dns_record_set" "restricted_a_record" {
  for_each      = local.endpoint_map
  project       = var.project_id
  managed_zone  = var.dns_zone_name
  name          = "${each.value}."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_cname_record" {
  for_each      = local.endpoint_map
  project       = var.project_id
  name          = "*.${each.value}."
  managed_zone  = var.dns_zone_name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["${each.value}."]
}

resource "random_string" "random_string" {
  length  = 4
  lower   = true
  upper   = false
  special = false
  numeric = true
}