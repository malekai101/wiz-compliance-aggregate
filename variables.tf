// This variable has no default and must be passed to the code at runtime.
variable "framework_name" {
  description = "The name of the aggregate security framework"
  type        = string
}

// This varaible has a default value but should be replaced.
variable "framework_description" {
  description = "The description of the aggregate security framework"
  type        = string
  default     = "A test aggregate security framework"
}