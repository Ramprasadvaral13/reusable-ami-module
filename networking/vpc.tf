resource "aws_vpc" "test" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
  
}

resource "aws_internet_gateway" "test_igw" {
    vpc_id = aws_vpc.test.id
  
}

resource "aws_subnet" "test_subnet" {
    vpc_id = aws_vpc.test.id
    for_each = var.subnets
    cidr_block = each.value.cidr
    availability_zone = each.value.az
    map_public_ip_on_launch = each.value.public
  
}

resource "aws_eip" "test_eip" {
    domain = "vpc"
  
}

resource "aws_nat_gateway" "test_nat" {
    allocation_id = aws_eip.test_eip.id
    subnet_id = aws_subnet.test_subnet[
        keys({
            for k,s in var.subnets : k=>s  if s.public == true
        })[0]
    ].id

}

resource "aws_route_table" "public_test_route" {
    vpc_id = aws_vpc.test.id
    route {
        cidr_block = var.route_cidr
        gateway_id = aws_internet_gateway.test_igw.id

    }
  
}

resource "aws_route_table" "private_test_route" {
    vpc_id = aws_vpc.test.id
    route {
        cidr_block = var.route_cidr
        gateway_id = aws_nat_gateway.test_nat.id
    }
  
}

resource "aws_route_table_association" "public_rtba" {
    for_each = {
        for k,s in var.subnets : k => s if s.public == true
    }
    subnet_id = aws_subnet.test_subnet[each.key].id
    route_table_id = aws_route_table.public_test_route.id
  
}

resource "aws_route_table_association" "private_rtba" {
    for_each = {
      for k,s in var.subnets : k => s if s.public == false
    }
    subnet_id = aws_subnet.test_subnet[each.key].id
    route_table_id = aws_route_table.private_test_route.id
    
  
}
