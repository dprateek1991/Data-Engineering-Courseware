/*

Add values of confidential variables in .bash_profile 0r .bashrc as

export TF_VAR_admin_users = <Add object_id of Admin User from Azure Actuve Directory>
export TF_VAR_tenant_id = <Add tenant_id of the subscription, you can get it from `az login` command>
export TF_VAR_subscription_id = <Add subscription_id of the subscription>

*/

variable "admin_users" {
  type  = string
}

variable "tenant_id" {
  type  = string
}

variable "subscription_id" {
  type  = string
}