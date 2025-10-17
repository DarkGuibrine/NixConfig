{ config, lib, inputs, pkgs, ... }: {

  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    desktopManager.cosmic.xwayland.enable = true;
  };
  
  environment.systemPackages = with pkgs; [

  ];
  #programs.kdeconnect = {
  #enable = true;
  #package = pkgs.valent;
#};
}
  