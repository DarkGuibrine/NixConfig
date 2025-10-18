{ config, lib, inputs, pkgs, ... }: {
  
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober/x86_64/stable"
      "com.dec05eba.gpu_screen_recorder/x86_64/stable"
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
