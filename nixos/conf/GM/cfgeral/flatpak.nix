{ config, lib, inputs, pkgs, ... }: {
  
  services.flatpak = {
    enable = true;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "*";
  };
}
