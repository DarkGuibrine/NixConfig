{ config, lib, inputs, pkgs, ... }: {
  
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
      update.auto = {
    enable = true;
    onCalendar = "weekly"; # Default value
    };
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "*";
  };
}
