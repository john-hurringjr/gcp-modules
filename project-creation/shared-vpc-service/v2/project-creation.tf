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
  Project Creation
 *****************************************/

resource "google_project" "project" {
  name            = "${var.project_id_category}-${var.project_id_unique}-${random_string.random_string.result}"
  project_id      = "${var.project_id_category}-${var.project_id_unique}-${random_string.random_string.result}"
  billing_account = var.billing_account_id
  folder_id       = var.folder_id
}

resource "random_string" "random_string" {
  length  = 4
  lower   = true
  upper   = false
  special = false
  numeric = true
}

resource "google_compute_shared_vpc_service_project" "project_to_shared_service" {
  host_project    = var.host_project_id
  service_project = google_project.project.project_id
}