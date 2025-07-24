variable "domain_name" {
  description = "DNS domain name of either the S3 bucket, or web site of your custom origin."
  type = string
}

variable "origin_id" {
  description = "Unique identifier for the origin."
  type = string
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type = bool
}

variable "default_root_object" {
  description = "Object that you want CloudFront to return when an end user requests the root URL."
  type = string
}

variable "allowed_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  type = list
}

variable "cached_methods" {
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
  type        = list
}

variable "target_origin_id" {
  description = " Value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior."
  type = string
}