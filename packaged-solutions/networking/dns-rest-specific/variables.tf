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
  Variables
 *****************************************/

variable "project_id" {
  description = "Identifies project which hosts the VPC where this rule will be applied."
  type        = string
}

variable "other_dns_endpoints_list" {
  type = list(string)
  default = [
    "gcr.io",
    "run.app",
    "composer.cloud.google.com",
    "pkg.dev",

  ]
}

variable "restricted_api_list" {
  type = list(string)
  default = [
    # Restricted VIP Only
    "discovery.googleapis.com",
    "oauth2.googleapis.com",
    "openidconnect.googleapis.com",
    "reauth.googleapis.com",

    #GA
    "accessapproval.googleapis.com",
    "aiplatform.googleapis.com",
    "alloydb.googleapis.com",
    "analyticshub.googleapis.com",
    "apigee.googleapis.com",
    "apigeeconnect.googleapis.com",
    "apphub.googleapis.com",
    "artifactregistry.googleapis.com",
    "automl.googleapis.com",
    "baremetalsolution.googleapis.com",
    "batch.googleapis.com",
    "beyondcorp.googleapis.com",
    "biglake.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerydatapolicy.googleapis.com",
    "bigquerydatatransfer.googleapis.com",
    "bigquerymigration.googleapis.com",
    "bigtable.googleapis.com",
    "binaryauthorization.googleapis.com",
    "blockchainnodeengine.googleapis.com",
    "certificatemanager.googleapis.com",
    "cloud.googleapis.com",
    "cloudaicompanion.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbuild.googleapis.com",
    "clouddeploy.googleapis.com",
    "clouderrorreporting.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudprofiler.googleapis.com",
    "cloudscheduler.googleapis.com",
    "cloudsearch.googleapis.com",
    "cloudtasks.googleapis.com",
    "cloudtrace.googleapis.com",
    "composer.googleapis.com",
    "compute.googleapis.com",
    "confidentialcomputing.googleapis.com",
    "config.googleapis.com",
    "connectgateway.googleapis.com",
    "connectors.googleapis.com",
    "contactcenterinsights.googleapis.com",
    "container.googleapis.com",
    "containeranalysis.googleapis.com",
    "containerfilesystem.googleapis.com",
    "containerregistry.googleapis.com",
    "containersecurity.googleapis.com",
    "containerthreatdetection.googleapis.com",
    "contentwarehouse.googleapis.com",
    "datacatalog.googleapis.com",
    "dataflow.googleapis.com",
    "dataform.googleapis.com",
    "datafusion.googleapis.com",
    "datalineage.googleapis.com",
    "datamigration.googleapis.com",
    "datapipelines.googleapis.com",
    "dataplex.googleapis.com",
    "dataproc.googleapis.com",
    "datastream.googleapis.com",
    "discoveryengine.googleapis.com",
    "dlp.googleapis.com",
    "dns.googleapis.com",
    "documentai.googleapis.com",
    "earthengine.googleapis.com",
    "essentialcontacts.googleapis.com",
    "eventarc.googleapis.com",
    "file.googleapis.com",
    "financialservices.googleapis.com",
    "firebaseappcheck.googleapis.com",
    "firebaserules.googleapis.com",
    "firestore.googleapis.com",
    "gameservices.googleapis.com",
    "gkeconnect.googleapis.com",
    "gkehub.googleapis.com",
    "gkemulticloud.googleapis.com",
    "gkeonprem.googleapis.com",
    "healthcare.googleapis.com",
    "iamcredentials.googleapis.com",
    "iap.googleapis.com",
    "iaptunnel.googleapis.com",
    "identitytoolkit.googleapis.com",
    "ids.googleapis.com",
    "integrations.googleapis.com",
    "kmsinventory.googleapis.com",
    "krmapihosting.googleapis.com",
    "language.googleapis.com",
    "livestream.googleapis.com",
    "logging.googleapis.com",
    "looker.googleapis.com",
    "managedidentities.googleapis.com",
    "memcache.googleapis.com",
    "meshca.googleapis.com",
    "metastore.googleapis.com",
    "microservices.googleapis.com",
    "migrationcenter.googleapis.com",
    "ml.googleapis.com",
    "monitoring.googleapis.com",
    "networkconnectivity.googleapis.com",
    "networkmanagement.googleapis.com",
    "networksecurity.googleapis.com",
    "networkservices.googleapis.com",
    "notebooks.googleapis.com",
    "ondemandscanning.googleapis.com",
    "opsconfigmonitoring.googleapis.com",
    "orgpolicy.googleapis.com",
    "osconfig.googleapis.com",
    "oslogin.googleapis.com",
    "parallelstore.googleapis.com",
    "policysimulator.googleapis.com",
    "policytroubleshooter.googleapis.com",
    "privateca.googleapis.com",
    "publicca.googleapis.com",
    "pubsub.googleapis.com",
    "pubsublite.googleapis.com",
    "recaptchaenterprise.googleapis.com",
    "recommender.googleapis.com",
    "redis.googleapis.com",
    "run.googleapis.com",
    "secretmanager.googleapis.com",
    "securetoken.googleapis.com",
    "securitycenter.googleapis.com",
    "servicecontrol.googleapis.com",
    "servicedirectory.googleapis.com",
    "spanner.googleapis.com",
    "speakerid.googleapis.com",
    "speech.googleapis.com",
    "sqladmin.googleapis.com",
    "ssh-serialport.googleapis.com",
    "storage.googleapis.com",
    "storageinsights.googleapis.com",
    "storagetransfer.googleapis.com",
    "sts.googleapis.com",
    "texttospeech.googleapis.com",
    "timeseriesinsights.googleapis.com",
    "tpu.googleapis.com",
    "trafficdirector.googleapis.com",
    "transcoder.googleapis.com",
    "translate.googleapis.com",
    "videointelligence.googleapis.com",
    "videostitcher.googleapis.com",
    "vision.googleapis.com",
    "visualinspection.googleapis.com",
    "vmmigration.googleapis.com",
    "vpcaccess.googleapis.com",
    "webrisk.googleapis.com",
    "websecurityscanner.googleapis.com",
    "workflows.googleapis.com",
    "workstations.googleapis.com",

    #Beta
    "adsdatahub.googleapis.com",
    "apikeys.googleapis.com",
    "assuredworkloads.googleapis.com",
    "backupdr.googleapis.com",
    "cloudcode.googleapis.com",
    "cloudcontrolspartner.googleapis.com",
    "cloudquotas.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudsupport.googleapis.com",
    "dialogflow.googleapis.com",
    "domains.googleapis.com",
    "firebasecrashlytics.googleapis.com",
    "gkebackup.googleapis.com",
    "iam.googleapis.com",
    "lifesciences.googleapis.com",
    "meshconfig.googleapis.com",
    "rapidmigrationassessment.googleapis.com",
    "retail.googleapis.com",
    "securesourcemanager.googleapis.com",
    "visionai.googleapis.com",
    "vmwareengine.googleapis.com",
  ]
}

variable "network_self_link" {
  type = string
}