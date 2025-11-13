{ config, lib, inputs, pkgs, ... }: {
  
  services.flatpak = {
    enable = true;
    packages = [
      "com.dec05eba.gpu_screen_recorder"
      "org.vinegarhq.Sober"
    ];
    update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "*";
  };
}
