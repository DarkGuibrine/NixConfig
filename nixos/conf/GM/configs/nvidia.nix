{ config, lib, inputs, pkgs, ... }: {
  
  ## Driver da nvidia proprietario 
  
  services.xserver.videoDrivers = [ "nvidia" ];
   hardware = {
    graphics.enable = true;
    nvidia.open = false; ## Se sua placa for pascal pra cima troque isso para true
  };

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "580.142";
    sha256_64bit = "sha256-IJFfzz/+icNVDPk7YKBKKFRTFQ2S4kaOGRGkNiBEdWM=";
    sha256_aarch64 = lib.fakeSha256;
    openSha256 = lib.fakeSha256;
    settingsSha256 = "sha256-BnrIlj5AvXTfqg/qcBt2OS9bTDDZd3uhf5jqOtTMTQM=";
    persistencedSha256 = lib.fakeSha256;
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
