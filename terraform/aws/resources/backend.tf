terraform {    
    required_version = ">= 0.12.0"
    backend "s3" {
        bucket  = "dataengineeringe2e"
        key     = "tfstate/state.tfstate"
        region  = "ap-southeast-1"
    }
}