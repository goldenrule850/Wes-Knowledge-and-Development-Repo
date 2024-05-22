```terraform
data "aws_ami" "aws_dc1" {
most_recent = true
	filter {
	name = "tag:Name"
	values = ["aws_dc1"]
	}

owners = ["self"]
}
```

How to reference data block in module
```terraform
module "aws_prod_dc1" {

source = "github.com/thinkstack-co/terraform-modules//modules/aws/ec2_instance?ref=v1.0.24"

  ami                    = data.aws_ami.aws_dc1.id
```

