variable "root_domain_name" {
  type        = string
  description = "The root domain name for the Hosted Zone where the Horde record should be created."
}

variable "github_credentials_secret_arn" {
  type        = string
  description = "The ARN of the Github credentials secret that should be used for pulling the Unreal Horde container from the Epic Games Github organization."
}

variable "unreal_horde_image" {
  type        = string
  description = "The Docker image to use for the Unreal Horde server."
}

variable "auth_method" {
  type        = string
  description = "The authentication method to use for the Unreal Horde server."
}

variable "oidc_client_id" {
  type        = string
  description = "The OIDC client ID to use for the Unreal Horde server."
  default = null
}

variable "oidc_authority" {
  type        = string
  description = "The OIDC authority to use for the Unreal Horde server."
  default = null
}

variable "oidc_client_secret" {
  type        = string
  description = "The OIDC client secret to use for the Unreal Horde server."
  default = null
}

variable "oidc_audience" {
  type        = string
  description = "The OIDC audience to use for the Unreal Horde server."
  default = null
}

variable "oidc_signin_redirect" {
  type        = string
  description = "The OIDC signin redirect to use for the Unreal Horde server."
  default = null
}
