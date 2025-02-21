provider "wiz" {
}

locals {
  framework_cats = concat(
    data.wiz_security_frameworks.hipaa.security_frameworks[0].category,
    data.wiz_security_frameworks.soc2.security_frameworks[0].category
  )
}


data "wiz_security_frameworks" "hipaa" {
  security_framework_ids = ["wf-id-2"]
}

data "wiz_security_frameworks" "soc2" {
  security_framework_ids = ["wf-id-5"]
}


resource "wiz_security_framework" "test" {
  name        = "smith-aggregate-framework"
  description = "test aggregate framework by csmith"
  enabled     = false

  dynamic "category" {
    for_each = local.framework_cats
    content {
      name        = category.value.name
      description = category.value.description

      dynamic "sub_category" {
        for_each = category.value.sub_category
        content {
          title       = sub_category.value.title
          description = sub_category.value.description
        }
      }
    }
  }
}


