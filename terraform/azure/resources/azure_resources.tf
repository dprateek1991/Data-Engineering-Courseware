module "resource_group_dataengineeringe2e" {
  source              = "./resource-group"
  resource_group_name = "dataengineeringe2e"
}
module "storage_account_dataengineeringe2e" {
  source                  = "./storage-account"
  storage_account_name    = "dataengineeringe2e"
  resource_group_name     = "dataengineeringe2e"
  excluded_ips            = ["116.87.127.105"]
  containers              = [
    "tfstate"
  ]
}