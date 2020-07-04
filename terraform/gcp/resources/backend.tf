terraform {

  required_version = ">= 0.12"
  backend "gcs" {
    bucket  = "dataengineeringe2e"
    prefix  = "tfstate/state.tfstate"
  }
}