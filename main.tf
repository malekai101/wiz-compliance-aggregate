// The wiz Terraform provider.  Details in the terraform.tf file.
provider "wiz" {
}

// A data resource to get the HIPAA security framework
data "wiz_security_frameworks" "hipaa" {
  security_framework_ids = ["wf-id-2"]
}

// A data resource to get the SOC2 security framework
data "wiz_security_frameworks" "soc2" {
  security_framework_ids = ["wf-id-5"]
}

/* 
A local block to concatenate the categories of the HIPAA and SOC2 security frameworks.  
Note that the data resources have interators for the security_frameworks attribute.  This 
is because the security_frameworks attribute is a list of security frameworks.  The data 
resource can be populated by matching string input.  In this example, the security_framework_id
is used to match the HIPAA and SOC2 security frameworks exactly.  We can be sure only one framework 
is returned because the security_framework_id is unique.  So we can just use the 0 iterator.
*/
locals {
  framework_cats = concat(
    data.wiz_security_frameworks.hipaa.security_frameworks[0].category,
    data.wiz_security_frameworks.soc2.security_frameworks[0].category
  )
}


/* 
A resource block to create an aggregate security framework from the HIPAA and SOC2 security frameworks. 
The category and sub_category attributes are dynamic blocks.  They are being built from the local framework_cats
variable.  The local framework_cats variable is a concatenation of the categories from the HIPAA and SOC2 security
frameworks.  Note that we are not checking for duplicates.  This woould be a problem in production.
*/
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
          // Controls is commented out because of the restriction on CLOUD_CONFIGURATION controls in the API.
          #controls                  = sub_category.value.controls
        }
      }
    }
  }
}


