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
  endpoint_map = toset(var.projected_api_endpoints)
}

resource "google_dns_record_set" "restricted_api_access_cname_record" {
  for_each      = local.endpoint_map
  project       = var.project_id
  name          = "${each.value}."
  managed_zone  = var.dns_zone_name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["restricted.googleapis.com."]
}
