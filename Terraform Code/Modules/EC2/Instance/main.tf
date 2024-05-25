# main.tf

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
  user_data                   = var.user_data
  monitoring                  = var.monitoring
  disable_api_termination     = var.disable_api_termination
  ebs_optimized               = var.ebs_optimized
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  tags = var.tags

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    delete_on_termination = var.root_volume_delete_on_termination
    encrypted   = var.root_volume_encryption
    iops        = var.root_volume_iops
    throughput = var.root_volume_throughput
    kms_key_id = var.key_name
  }


