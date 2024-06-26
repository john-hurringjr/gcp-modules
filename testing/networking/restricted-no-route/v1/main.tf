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
  Network
 *****************************************/

resource "google_compute_network" "network" {
  project                         = var.project_id
  name                            = var.network_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

/******************************************
  Subnet Network 1
 *****************************************/

resource "google_compute_subnetwork" "subnet_1" {
  project       = var.project_id
  ip_cidr_range = var.region_1_cidr
  name          = "${var.network_name}-${var.region_1}"
  network       = google_compute_network.network.self_link
  region        = var.region_1

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

  secondary_ip_range {
    ip_cidr_range = var.region_1_pod_cidr
    range_name    = "pod-ip-range"
  }

  secondary_ip_range {
    ip_cidr_range = var.region_1_services_cidr
    range_name    = "services-ip-range"
  }

}

/******************************************
  Subnet Network 2
 *****************************************/

resource "google_compute_subnetwork" "subnet_2" {
  project       = var.project_id
  ip_cidr_range = var.region_2_cidr
  name          = "${var.network_name}-${var.region_2}"
  network       = google_compute_network.network.self_link
  region        = var.region_2

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

  secondary_ip_range {
    ip_cidr_range = var.region_2_pod_cidr
    range_name    = "pod-ip-range"
  }

  secondary_ip_range {
    ip_cidr_range = var.region_2_services_cidr
    range_name    = "services-ip-range"
  }

}

/******************************************
  Subnet Network Serverless
 *****************************************/

resource "google_compute_subnetwork" "subnet_serverless_1" {
  project       = var.project_id
  ip_cidr_range = var.region_1_serverless_cidr
  name          = "${var.network_name}-serverless-${var.region_1}"
  network       = google_compute_network.network.self_link
  region        = var.region_1

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

}

resource "google_compute_subnetwork" "subnet_serverless_2" {
  project       = var.project_id
  ip_cidr_range = var.region_2_serverless_cidr
  name          = "${var.network_name}-serverless-${var.region_2}"
  network       = google_compute_network.network.self_link
  region        = var.region_2

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

}
/******************************************
  Route
 *****************************************/
resource "google_compute_route" "route" {
  project          = var.project_id
  name             = "${google_compute_network.network.name}-restricted-api-access"
  dest_range       = "199.36.153.4/30"
  network          = google_compute_network.network.self_link
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}