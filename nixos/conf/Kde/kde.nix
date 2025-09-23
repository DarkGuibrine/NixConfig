{ config, lib, inputs, pkgs, ... }: {

  ## Ativar ambiente gráfico KDE Plasma 6 e gerenciador de login SDDM
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
  programs.kdeconnect.enable = true;

   environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
    kdePackages.filelight
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.qtmultimedia
    kdePackages.kate
    kdePackages.kcalc
   ];

}
