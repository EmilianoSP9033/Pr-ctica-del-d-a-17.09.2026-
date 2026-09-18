terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

provider "local" {}

# VULNERABILIDAD INTENCIONAL: Secreto expuesto por defecto
# SOLUCIÓN: Se elimina el valor hardcodeado y el secreto se proporciona mediante TF_VAR_api_secret_token.
variable "api_secret_token" {
  type        = string
  description = "Token secreto de la API"
  sensitive   = true
}

resource "local_file" "output_secreto" {
  filename = "${path.module}/configuracion.txt"
  content  = "El sistema se ha iniciado correctamente usando el token."
}