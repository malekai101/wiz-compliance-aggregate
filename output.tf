// These outputs are for the existing frameworks.

output "soc2_name" {
  description = "The name of the SOC2 security framework"
  value       = data.wiz_security_frameworks.soc2.security_frameworks[0].name
}

output "soc2_id" {
  description = "The ID of the SOC2 security framework"
  value       = data.wiz_security_frameworks.soc2.security_frameworks[0].id
}

output "hipaa_name" {
  description = "The name of the HIPAA security framework"
  value       = data.wiz_security_frameworks.hipaa.security_frameworks[0].name
}

output "hipaa_id" {
  description = "The ID of the HIPAA security framework"
  value       = data.wiz_security_frameworks.hipaa.security_frameworks[0].id
}


// These outputs are for the new aggregate framework.
output "aggregate_framework_id" {
  description = "The ID of the new aggregate framework"
  value       = wiz_security_framework.aggregate_framework.id
}

output "aggregate_framework_name" {
  description = "The name of the new aggregate framework"
  value       = wiz_security_framework.aggregate_framework.name
}
