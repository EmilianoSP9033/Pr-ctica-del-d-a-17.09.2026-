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
variable "api_secret_token" {
  type        = string
  description = "Token secreto de la API"
  default     = "SUPER_SECRET_TOKEN_EXPUESTO_12345" 
}

resource "local_file" "output_secreto" {
  filename = "${path.module}/configuracion.txt"
  content  = "El sistema se ha iniciado correctamente usando el token."
}
