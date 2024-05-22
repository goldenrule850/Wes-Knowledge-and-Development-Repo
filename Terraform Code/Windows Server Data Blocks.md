### Windows Server 2022

```terraform
data "aws_ami" "windows_server_2022_full_base" {
most_recent = true
filter {
	name = "name"
	values = ["Windows_Server-2022-English-Full-Base-*"]
}

filter {
	name = "virtualization-type"
	values = ["hvm"]
}
owners = ["amazon"]
}
```

```
ami   = data.aws_ami.windows_server_2022_full_base.id
```

### Windows Server 2019

```terraform
data "aws_ami" "windows_server_2019_full_base" {
most_recent = true
filter {
	name = "name"
	values = ["Windows_Server-2019-English-Full-Base-*"]
}

filter {
	name = "virtualization-type"
	values = ["hvm"]
}
owners = ["amazon"]
}
```

```
ami   = data.aws_ami.windows_server_2019_full_base.id
```