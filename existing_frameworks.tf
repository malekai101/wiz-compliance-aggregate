provider "wiz" {
}


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

/*
output "hippa_flat" {
  value = local.security_sub_categories
}

locals {
  security_sub_categories = flatten([
    for framework in data.wiz_security_frameworks.hipaa.security_frameworks : [
      for category in framework.category : [
        for sub_category in category.sub_category : {
          framework_id             = framework.id
          category_id              = category.id
          category_name            = category.name
          sub_category_id          = sub_category.id
          sub_category_description = sub_category.description
        }
      ]
    ]
  ])
}
*/
