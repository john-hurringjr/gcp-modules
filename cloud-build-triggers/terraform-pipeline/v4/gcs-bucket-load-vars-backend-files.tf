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
  Bucket to store tfvars and backend tf files
 *****************************************/
resource "google_storage_bucket" "tfvars_files_bucket" {
  project   = var.project_id
  name      = "${var.gcs_bucket_unique_id}-terraform-variables-${random_string.tfvars_files_bucket_random_string.result}"
  location  = var.gcs_terraform_bucket_location
  storage_class = "MULTI_REGIONAL"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

}

resource "google_storage_bucket_object" "tfvars_folders" {
  for_each = local.folder_list
  bucket = google_storage_bucket.tfvars_files_bucket.name
  // Trailing / will make this a directory
  name   = "${each.value}/"
  // below required despite note being used... :(
  content = "foo"
}

/******************************************
  Random String
 *****************************************/
resource "random_string" "tfvars_files_bucket_random_string" {
  length    = 10
  lower     = true
  upper     = false
  special   = false
  numeric   = true
}