variable "project_id" {
  description = "The ID of the Google Cloud project where resources will be created."
  type        = string  
  
}
variable "region" {
  description = "The Google Cloud region where resources will be created."
  type        = string
  default     = "us-central1"   
  
}