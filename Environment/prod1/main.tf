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
  source = "../../modules/subnet"
  subnet = var.subnet

  # HARD DEPENDENCY: Is line se Terraform enforce karega ki 
  # VNet Azure par completely ban chuka hai.
  depends_on = [
    module.vnet.vnet_output
  ]
}

module "public_ip" {
  depends_on = [module.rgs]
  source     = "../../modules/public_ip"
  public_ip  = var.public_ip
}

module "nic" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../modules/nic"
  nic        = var.nic
}

module "vm" {
  depends_on = [module.nic]
  source     = "../../modules/vm"
  vm         = var.vm
}