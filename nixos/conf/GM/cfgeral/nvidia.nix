{ config, lib, inputs, pkgs, ... }: {

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia.open = false;
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
    #nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
}
