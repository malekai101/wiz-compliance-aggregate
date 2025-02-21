output "soc2_name" {
  value = data.wiz_security_frameworks.soc2.security_frameworks[0].name
}

output "soc2_id" {
  value = data.wiz_security_frameworks.soc2.security_frameworks[0].id
}

output "hipaa_name" {
  value = data.wiz_security_frameworks.hipaa.security_frameworks[0].name
}

output "hipaa_id" {
  value = data.wiz_security_frameworks.hipaa.security_frameworks[0].id
}
