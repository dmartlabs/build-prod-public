
resource "google_cloudbuild_trigger" "triggers" {
  for_each  = var.triggers
  name          = each.key
  description   = each.value.trigger_description
  disabled      = (var.global_disable) ? true : each.value.trigger_disabled
  filename = "cloudbuild.yaml"

  trigger_template {
    branch_name = each.value.branch_name
    repo_name   = each.value.repo_name
  }

  substitutions = merge(var.const_substitutions, each.value.substitutions)
}




/*######################flexitime-applicant-prod-trigger######################
resource "google_cloudbuild_trigger" "flexitime-applicant-prod-trigger" {
  name          = "flexitime-applicant-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_cohort-web-applicant"
  }

  substitutions = {
    _REACT_APP_GOOGLE_GEO_API_KEY ="AIzaSyDENJzBUoXuffxauKyYcaZNHKdD1PiYN9c"
    _HOST_NAME    ="api.flexitime.in"
    _ADMIN_PASS   ="admin"
    _DEP_REPLICAS = "1"
	  _GKE_CLUSTER  = "prod-mum-02"
	  _GKE_REGION   = "asia-south1-a"
	  _REACT_APP_API_URL = "https://api.flexitime.in/"
	  _MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	  _NAMESPACE = "cohort"
	  _SPRING_PROFILES_ACTIVE = "prod"
	  _SONAR_SCANNER_IMAGE  ="asia.gcr.io/meradmart/sonar-scanner"
  }
  
  filename = "cloudbuild.yaml"
}
######################flexitime-api-prod-trigger######################
resource "google_cloudbuild_trigger" "flexitime-api-prod-trigger" {
  name          = "flexitime-api-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_cohort-api"
  }

  substitutions = {
  _KALEYRA_API_KEY ="Ad4697c352044b2f3894b5ea14276ab08"
  _ADMIN_PASS   ="c0h0}4C1X99_~A_n'+O"
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MONGO_CLOUD_URL_VALUE ="mongodb+srv://cohortproduser:5uq5aeafUozcuKEW@cohort-prod-w0eot.gcp.mongodb.net/cohortdb?retryWrites=true&w=majority&maxPoolSize=50&maxIdleTimeMS=60000"
	_MASTER_AUTHORIZED_NETWORKS = "125.17.114.66/32,122.15.178.69/32,106.51.86.180/32"
	_NAMESPACE = "cohort"
	_SPRING_PROFILES_ACTIVE = "prod"
	
  }
  
  filename = "cloudbuild.yaml"
}
######################flexitime-admin-prod-trigger######################
resource "google_cloudbuild_trigger" "flexitime-admin-prod-trigger" {
  name          = "flexitime-admin-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_cohort-web-admin"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_REACT_APP_API_URL = "https://api.flexitime.in/"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "cohort"
	_SPRING_PROFILES_ACTIVE = "prod"
	_SONAR_SCANNER_IMAGE  ="asia.gcr.io/meradmart/sonar-scanner"
  }
  
  filename = "cloudbuild.yaml"
}
######################flexitime-web-manager-prod-trigger######################
resource "google_cloudbuild_trigger" "flexitime-web-manager-prod-trigger" {
  name          = "flexitime-web-manager-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_cohort-web-manager"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_REACT_APP_API_URL = "https://api.flexitime.in/"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "cohort"
	_SPRING_PROFILES_ACTIVE = "prod"
	_SONAR_SCANNER_IMAGE  ="asia.gcr.io/meradmart/sonar-scanner"
  }
  
  filename = "cloudbuild.yaml"
}
##################### ne-prod-trigger#######################
resource "google_cloudbuild_trigger" "ne-prod-trigger" {
  name          = "ne-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_notification-email"
  }

  substitutions = {
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "flash"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
###################### notification-slack-prod-trigger######################
resource "google_cloudbuild_trigger" "notification-slack-prod-trigger" {
  name          = "notification-slack-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_notification-slack"
  }

  substitutions = {
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "flash"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
###################### notification-sms-prod-trigger######################
resource "google_cloudbuild_trigger" "notification-sms-manager-prod-trigger" {
  name          = "notification-sms-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_notification-sms"
  }

  substitutions = {
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "flash"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
###################### Sickness-Tracker-prod-trigger######################
resource "google_cloudbuild_trigger" "Sickness-Tracker-prod-trigger" {
  name          = "Sickness-Tracker-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_st-api"
  }

  substitutions = {
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "st"
  _MONGO_CLOUD_URL_VALUE ="mongodb+srv://stuser:IjSL0h6QygkSyZq9@cohort-prod-w0eot.gcp.mongodb.net/sickness-tracker?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
  _SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
###################### st-web-prod-trigger######################
resource "google_cloudbuild_trigger" "st-web-prod-trigger" {
  name          = "st-web-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_st-web"
  }

  substitutions = {
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "st"
  _SONAR_SCANNER_IMAGE ="asia.gcr.io/meradmart/sonar-scanner:latest"
  _REACT_APP_API_URL ="https://w3api.meradmart.com"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
###################### corporate-api-content ######################
resource "google_cloudbuild_trigger" "corporate-api-content-prod-trigger" {
  name          = "corporate-api-content-prod-trigger-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_corporate-api-content"
  }

  substitutions = {
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
  _MONGO_CLOUD_URL_VALUE = "mongodb+srv://corpuser:p65GYTvnHb3J2OQQ@cohort-prod-w0eot.gcp.mongodb.net/corp?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "corporate"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
####################corporate-feedback-prod########################
resource "google_cloudbuild_trigger" "feedback-prod" {
  name          = "feedback-prod-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_corporate-feedback"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "corporate"
  _MONGO_CLOUD_URL_VALUE = "mongodb+srv://corpuser:p65GYTvnHb3J2OQQ@cohort-prod-w0eot.gcp.mongodb.net/corp?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
  _HOST_NAME ="api.dmartindia.com"
  _RECAPTCHA_SECRET_KEY_VALUE ="6LdKg_0UAAAAABt0Ku_-QtBSmvffuHi7Rg5hwx2y"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
###################### dmart-corporate-prod######################
resource "google_cloudbuild_trigger" "corporate-prod" {
  name          = "corporate-prod-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_dmart-corporate"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "corporate"
  _REACT_APP_API_URL_VALUE ="https://api.dmartindia.com"
  _REACT_APP_MDF_API_URL_VALUE  = "https://api.dmartindia.com"
  _REQ_CPU_VALUE = "100m"
  _REQ_MEM_VALUE = "128Mi"
  _REACT_APP_CAPTACHA_KEY_VALUE = "6LdKg_0UAAAAAGhploFNjTULYF_eCDXv69lqW0Z5"
  _REACT_APP_GA_VALUE           = "UA-171026796-1"
  }
  
  filename = "cloudbuild.yaml"
}
###################### partner-onboard######################
resource "google_cloudbuild_trigger" "partner-onboard" {
  name          = "partner-onboard-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_partner-onboard"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "corporate"
  _MONGO_CLOUD_URL_VALUE = "mongodb+srv://corpuser:p65GYTvnHb3J2OQQ@cohort-prod-w0eot.gcp.mongodb.net/corp?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
	_SPRING_PROFILES_ACTIVE = "prod"
  _SECRET_KEY_VALUE  ="6LdKg_0UAAAAABt0Ku_-QtBSmvffuHi7Rg5hwx2y"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
##################dmart-corporate-admin##########################
resource "google_cloudbuild_trigger" "corporate-admin" {
  name          = "corporate-admin-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_dmart-corporate-admin"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "corporate"
  _HOST_NAME ="admin.dmartindia.com" 
  _REACT_APP_API_URL     = "https://api.dmartindia.com"
  _REQ_CPU = "50m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
##################mdm-site##########################
resource "google_cloudbuild_trigger" "mdm-site" {
  name          = "mdm-site-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_mdm-site"
  }

  substitutions = {
  _DEP_REPLICAS = "2"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "corporate"
  _MONGO_CLOUD_URL_VALUE      = "mongodb+srv://corpuser:p65GYTvnHb3J2OQQ@cohort-prod-w0eot.gcp.mongodb.net/corp?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
######################st-scheduler-trigger######################
resource "google_cloudbuild_trigger" "st-scheduler" {
  name          = "st-scheduler-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_st-scheduler"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
  _MONGO_CLOUD_URL_VALUE ="mongodb+srv://stuser:IjSL0h6QygkSyZq9@cohort-prod-w0eot.gcp.mongodb.net/sickness-tracker?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
	_NAMESPACE = "st-export"
  _FEED_LOCATION_VALUE ="/data/st/outbox"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  _LIM_CPU ="250m"
  _LIM_MEM ="1Gi"
  }
  
  filename = "cloudbuild.yaml"
}
######################ftp-handler-trigger######################
resource "google_cloudbuild_trigger" "ftp-handler" {
  name          = "ftp-handler-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_ftp-handler"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
	_NAMESPACE = "meradmart"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  }
  
  filename = "cloudbuild.yaml"
}
######################corporate-archive-scheduler######################
resource "google_cloudbuild_trigger" "corporate-archive-scheduler" {
  name          = "corporate-archive-scheduler-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_corporate-archive-scheduler"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
  _MONGO_CLOUD_URL_VALUE = "mongodb+srv://corpuser:p65GYTvnHb3J2OQQ@cohort-prod-w0eot.gcp.mongodb.net/corp?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
	_NAMESPACE = "corporate-jobs"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  _LIM_CPU = "250m"
  _LIM_MEM = "1Gi"
  }
  
  filename = "cloudbuild.yaml"
}
######################corporate-feedback-exporter-trigger######################
resource "google_cloudbuild_trigger" "corporate-feedback-exporter-trigger" {
  name          = "corporate-feedback-exporter-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_corporate-feedback-exporter"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
  _MONGO_CLOUD_URL_VALUE = "mongodb+srv://corpuser:p65GYTvnHb3J2OQQ@cohort-prod-w0eot.gcp.mongodb.net/corp?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
	_NAMESPACE = "corporate-export"
  _FEED_LOCATION_VALUE ="/data/corporate/feedback/outbox"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  _LIM_CPU = "250m"
  _LIM_MEM = "1Gi"
  }
  
  filename = "cloudbuild.yaml"
}
###################corporate-partner-exporter#########################
resource "google_cloudbuild_trigger" "corporate-partner-exporter" {
  name          = "corporate-partner-exporter-prod-mum-02"
  description   =  "Push to prod branch"
  disabled       = true
  trigger_template {
    branch_name = "prod"
    repo_name   = "github_dmartlabs_corporate-partner-exporter"
  }

  substitutions = {
  _DEP_REPLICAS = "1"
	_GKE_CLUSTER  = "prod-mum-02"
	_GKE_REGION   = "asia-south1-a"
	_MASTER_AUTHORIZED_NETWORKS = "122.15.178.69/32,34.73.195.204/32,106.51.86.180/32,125.17.114.66/32"
  _MONGO_CLOUD_URL_VALUE = "mongodb+srv://corpuser:p65GYTvnHb3J2OQQ@cohort-prod-w0eot.gcp.mongodb.net/corp?retryWrites=true&w=majority&maxPoolSize=25&maxIdleTimeMS=60000"
	_NAMESPACE = "corporate-export"
	_SPRING_PROFILES_ACTIVE = "prod"
  _REQ_CPU = "100m"
  _REQ_MEM = "128Mi"
  _LIM_CPU = "250m"
  _LIM_MEM = "1Gi"
  }
  
  filename = "cloudbuild.yaml"
}
*/