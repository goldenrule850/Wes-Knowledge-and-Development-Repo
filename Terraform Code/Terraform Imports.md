### EC2 Instance

```terraform
terraform import 'module.example_server.aws_instance.ec2[0]' i-1234567890abcdefg
```

#### Remove Instance

```terraform
terraform state rm 'module.example_server.aws_instance.ec2[0]'
```

```terraform
terraform import 'module.aws_prod_radius.aws_instance.ec2[0]' i-0ca2fc57effe01fbf
```


### EBS Volume

```terraform
terraform import module.example_drive.aws_ebs_volume.vol vol-01234567890
```

#### DEV/SDB Volume Attachment
```terraform
terraform import module.example_d_drive.aws_volume_attachment.vol_attach /dev/sdb:vol-01234567890:i-1234567890abcdefg
```

#### XVDC Volume Attachment
```terraform
terraform import module.example_d_drive.aws_volume_attachment.vol_attach xvdc:vol-01234567890:i-1234567890abcdefg
```

#### Remove Volume

```terraform
terraform state rm module.example_d_drive.aws_ebs_volume.vol
```

#### Remove Volume Attachment

```terraform
terraform state rm module.example_d_drive.aws_volume_attachment.vol_attach
```


### Security Groups

```terraform
terraform import module.example_sg.aws_security_group.security_group sg-0123456789
```


### LOAD BALANCER

```terraform
################ APPLICATION LOAD BALANCER IMPORTS ####################################

terraform import module.amplify-dev-internal-nlb.aws_lb.this arn:aws:elasticloadbalancing:us-west-2:256470530361:loadbalancer/net/amplify-dev-internal-nlb/a7e5bcd5e41c9dc6

terraform import module.amplify-dev-qc-lb_alb_ssl_certificate.aws_acm_certificate.cert arn:aws:acm:us-west-2:256470530361:certificate/ea428f05-a2e8-4877-b92a-06f2810cedbf

terraform import module.amplify-dev-qc-lb-listener_443.aws_alb_listener.listener arn:aws:elasticloadbalancing:us-west-2:256470530361:listener/app/amplify-dev-qc-lb/a88e5a79138a6315/927965049620b6a8

module.amplify-dev-nlb-builder-tg1.aws_lb_target_group_attachment.this arn:aws:elasticloadbalancing:us-west-2:256470530361:targetgroup/amplify-dev-nlb-builder-tg1/e04b7027e7c6a116

terraform import module.amplify-alb-ssl-certificate.aws_acm_certificate.cert arn:aws:acm:us-west-2:256470530361:certificate/e1b904f7-72b7-4e11-9fcc-87466ae40332

terraform state rm module.amplify-alb-ssl-certificate.aws_acm_certificate.cert
```

```terraform
terraform state rm
terraform state rm module.amplify-dev-internal-nlb.aws_lb.this
terraform state rm module.amplify-dev-nlb-builder-tg1.aws_lb_target_group.this
terraform state rm module.amplify-dev-nlb-builder-tg1.aws_lb_target_group_attachment.this
```