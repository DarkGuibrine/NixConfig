{ config, lib, inputs, pkgs, ... }: {

  ## Ativar ambiente gráfico KDE Plasma 6 e gerenciador de login SDDM
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
    kdePackages.filelight
    kdePackages.qtmultimedia
    kdePackages.kcalc
   ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
   ]; 

}
