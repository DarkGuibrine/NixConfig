{ config, lib, inputs, pkgs, ... }: {

  #services.xserver.videoDrivers = [ "nouveau" ];
  #hardware.graphics = {
  # enable = true;
  # extraPackages = with pkgs; [
  #   mesa
  # ];
  #};

  #hardware.enableRedistributableFirmware = true;
  #environment.variables = {
  #  MESA_VK_DRIVER_OVERRIDE = "nvk";
  #  VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/nouveau_icd.x86_64.json";
  #};
  
  
  services.xserver.videoDrivers = [ "nvidia" ];
   hardware = {
    graphics.enable = true;
    nvidia.open = false;
   #nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
   #nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
  #chaotic.mesa-git.enable = true;
}
