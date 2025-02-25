
#creating module eks
module "eks" {
    #source module from terraform registry
    source = "terraform-aws-modules/eks/aws"
    version = "20.8.4"
    cluster_name = var.cluster_name
    cluster_version = var.cluster_version
    subnet_ids = module.vpc.private_subnets
    vpc_id = module.vpc.vpc_id
    cluster_endpoint_public_access = true


    eks_managed_node_groups = { 
        node_group = {
            desired_size = 2
            min_size = 1
            max_size = 3
            instance_types = ["t2.micro"]
        }

    }
    # eks_managed_node_group_defaults = {
    #     ami_type = "AL2_x86_64"
    #     instance_types = ["t2.micro"]
    #     disk_size = 20
    #     key_name = "test-routing-123"
    #     subnets = module.vpc.private_subnets
    #     tags = {
    #         Terraform = "true"
    #         name = "eks-node-group"
    #     }
    # }
}