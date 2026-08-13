module "rgs" {
  source = "../../modules/rg"
  rgs    = var.rgs
}
module "vnet" {
  depends_on = [module.rgs]
  source     = "../../modules/vnet"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/subnet"
  subnet     = var.subnet
}

module "nic" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../modules/nic"
  nic        = var.nic

}

module "public_ip" {
  depends_on = [module.rgs]
  source     = "../../modules/public_ip"
  public_ip  = var.public_ip

}

module "vm" {
  depends_on = [module.nic]
  source     = "../../modules/vm"
  vm         = var.vm

}