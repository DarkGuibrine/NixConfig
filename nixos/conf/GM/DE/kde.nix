{ config, lib, inputs, pkgs, ... }: {

  ## Ativar ambiente gráfico KDE Plasma 6 e gerenciador de login SDDM
  services = {
    desktopManager.plasma6.enable = true;
  };
  services.displayManager.plasma-login-manager = {
    enable = true;
  };

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
    kdePackages.filelight
    kdePackages.qtmultimedia
    kdePackages.kcalc
    kdePackages.sddm-kcm
    kdePackages.wallpaper-engine-plugin
    kdePackages.krdp
   ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
   ]; 
     
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "*";
  };

}
