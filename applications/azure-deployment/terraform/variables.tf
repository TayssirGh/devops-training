variable "location" {
  description = "You can find a list of azure regions in here https://gist.github.com/ausfestivus/04e55c7d80229069bf3bc75870630ec8"
  type        = string
}
variable "resource_group_name" {
  description = "Training-ap"
  type        = string
  default     = "training"
}