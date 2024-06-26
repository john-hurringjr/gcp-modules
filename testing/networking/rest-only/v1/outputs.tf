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
  Outputs
 *****************************************/


output "firewall_rule_iap_self_link" {
  value       = google_compute_firewall.firewall_rule_iap.self_link
  description = "Self link of firewall rule created"
}
output "firewall_rule_iap_id" {
  value       = google_compute_firewall.firewall_rule_iap.id
  description = "ID of firewall rule created"
}

output "network_self_link" {
  value = google_compute_network.network.self_link
}

output "network_id" {
  value = google_compute_network.network.id
}
output "network_name" {
  value = google_compute_network.network.name
}

output "subnet_region_1_self_link" {
  value = google_compute_subnetwork.subnet_1.self_link
}

output "subnet_region_1_id" {
  value = google_compute_subnetwork.subnet_1.id
}

output "subnet_region_2_self_link" {
  value = google_compute_subnetwork.subnet_2.self_link
}

output "subnet_region_2_id" {
  value = google_compute_subnetwork.subnet_2.id
}

output "subnet_region_1_serverless_self_link" {
  value = google_compute_subnetwork.subnet_serverless_1.self_link
}

output "subnet_region_1_serverless_id" {
  value = google_compute_subnetwork.subnet_serverless_1.id
}

output "subnet_region_2_serverless_self_link" {
  value = google_compute_subnetwork.subnet_serverless_2.self_link
}

output "subnet_region_2_serverless_id" {
  value = google_compute_subnetwork.subnet_serverless_2.id
}