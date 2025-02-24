# Wiz Compliance Aggregate

## Overview
[Wiz](http://www.wiz.io) is a leading SaaS CNAPP platform.  Companies use Wiz to track their cloud estate's adherance with industry compliance frameworks.  Wiz provides industry compliance frameworks and associated controls out of the box.  The Wiz platform also enables customers to build custom compliance frameworks.  Customers frequently will combine one or more existing compliance frameworks to build a new, custom framework.

Wiz Compliance Aggregate is a project demonstrating the aggregation of multiple compliance frameworks on the Wiz platform using Terraform. [Terraform](https://www.terraform.io/) is an industry standard infrastructure as code platform used to manage the lifecycle of cloud native resources.  Using Terraform for manage custom Wiz compliance frameworks controls drift and manages the aggregated framework's complete lifecycle.  

The Terraform code in this project pulls the data about two compliance frameworks, SOC2 and HIPAA, and builds a new compliance framework, combining the categories, subcategories, cloud controls, and host controls from the existing frameworks into the new aggregated framework.  As SOC2 and HIPAA change, new runs of the Terraform code will pick up the changes and apply them to the new aggregated framework.

**This code is DEMO code only and should NOT be used in production.**  Please see the caveats section for more information.

## Caveats
- This code is demo code only.  It is intended to teach concepts of building an aggregated framework but not to be run as-is.
- This code has **NOT** been tested in production.
- Beware of duplicate category and subcategory names.  This can cause the code to fail.
- The code does not build new categories and subcategories.  More complex code would be needed to combine controls from the source frameworks into new categories and subcategories in the new framework.
- Controls of the type **CLOUD_CONFIGURATION** cannot be added to a compliance framework through Terraform.  This could be filtered in production code but for this demo code the `controls` attribute is not populated. 

## Testing
This code can be tested and will build a disabled custom framework.  Again, this is not for production.  Refer to the Terraform documentation or [tutorials](https://developer.hashicorp.com/terraform/tutorials) for more information about using Terraform.  A few tips:
- Make sure you are managing your Terraform [state](https://developer.hashicorp.com/terraform/language/state).
- The Wiz provider requires a [service account](https://docs.wiz.io/wiz-docs/docs/wiz-terraform-provider#create-a-wiz-service-account) to authenticate.  This service account should be created with least privilidges.  Best practice is to pass the service account name and secret by environmental variable.  The service account secret is a secret.  It should be protected as such.    
- Make sure you have testing environment and test plan for all automation.
- Utilize SDLC best practices with all automation development.  

## Resources
Note that all Wiz resources require authentication:
- [Wiz Compliance](https://docs.wiz.io/wiz-docs/docs/compliance-solutions?lng=en)
- [Wiz Terraform documentation](https://docs.wiz.io/wiz-docs/docs/wiz-terraform-provider):
  - Data resource: [wiz-security-frameworks](https://docs.wiz.io/wiz-docs/docs/wiz-security-frameworks)
  - Resource: [wiz-security-frameworks](https://docs.wiz.io/wiz-docs/docs/wiz-security-framework)
- HashiCorp Terraform [documentation](https://developer.hashicorp.com/terraform?product_intent=terraform):
  - Terraform [dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)


## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


