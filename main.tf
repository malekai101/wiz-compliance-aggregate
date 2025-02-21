provider "wiz" {
}

// A data resources to get the HIPAA security framework
data "wiz_security_frameworks" "hipaa" {
  security_framework_ids = ["wf-id-2"]
}

// A data resources to get the SOC2 security framework
data "wiz_security_frameworks" "soc2" {
  security_framework_ids = ["wf-id-5"]
}

// A local block to concatenate the categories of the HIPAA and SOC2 security frameworks
locals {
  framework_cats = concat(
    data.wiz_security_frameworks.hipaa.security_frameworks[0].category,
    data.wiz_security_frameworks.soc2.security_frameworks[0].category
  )
}


// A resource block to create an aggregate security framework from the HIPAA and SOC2 security frameworks
resource "wiz_security_framework" "aggregate_framework" {
  name                               = var.framework_name
  description                        = var.framework_description
  enabled                            = true
  maintain_rule_links_from_framework = true

  dynamic "category" {
    for_each = local.framework_cats
    content {
      name        = category.value.name
      description = category.value.description

      dynamic "sub_category" {
        for_each = category.value.sub_category
        content {
          title                     = sub_category.value.title
          description               = sub_category.value.description
          cloud_configuration_rules = sub_category.value.cloud_configuration_rules
          host_configuration_rules  = sub_category.value.host_configuration_rules
          controls                  = sub_category.value.controls
        }
      }
    }
  }
}


