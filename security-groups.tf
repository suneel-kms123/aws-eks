resource "aws_security_group" "aws_security_group" {
    vpc_id = module.vpc.vpc_id
    name = "eks-cluster-sg"
    description = "Allow all traffic to EKS cluster"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["174.0.1.0/24", "174.0.2.0/24"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }  

    tags = {
        Name = "eks-cluster-sg"
    }
}