project_id = "meradmart"
region     = "us-central1"
global_disable = true
const_substitutions =  {
    _GKE_CLUSTER  = "canary-uscentral-01"
    _GKE_REGION   = "us-central1"
    _MASTER_AUTHORIZED_NETWORKS = "125.17.114.66/32,122.15.178.69/32,106.51.86.180/32"
}
triggers = {

        flexitime-api ={
            branch_name = "canary"
            repo_name   = "dmartlabs_cohort-api"
            trigger_description = ""
            trigger_disabled = false
            substitutions = {
                _KALEYRA_API_KEY ="Ad4697c352044b2f3894b5ea14276ab08"
                _ADMIN_PASS   ="c0h0}4C1X99_~A_n'+O"
                _DEP_REPLICAS = "1"
                _MONGO_CLOUD_URL_VALUE ="mongodb+srv://cohortproduser:5uq5aeafUozcuKEW@cohort-prod-w0eot.gcp.mongodb.net/cohortdb?retryWrites=true&w=majority&maxPoolSize=50&maxIdleTimeMS=60000"
                _NAMESPACE = "cohort"
                _SPRING_PROFILES_ACTIVE = "canary"
            }
        },
}
