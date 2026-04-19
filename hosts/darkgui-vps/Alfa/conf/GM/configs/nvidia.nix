{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  ## Driver da nvidia proprietario

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia.open = false; # # Se sua placa for pascal pra cima troque isso para true
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  ## Teste sobre o nvk nao recomendo usar

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
}
