{ config, lib, inputs, pkgs, ... }: {

  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    desktopManager.cosmic.xwayland.enable = true;
  };
  
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  environment.systemPackages = with pkgs; [
    gnome-disk-utility
  ];
   environment.cosmic.excludePackages = with pkgs; [ 
    cosmic-files
   ];
  programs.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };
  services.desktopManager.cosmic.showExcludedPkgsWarning = false;

}
  