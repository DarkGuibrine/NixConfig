{ config, lib, inputs, pkgs, ... }: {

  ## Configuração do driver NVIDIA
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

}
