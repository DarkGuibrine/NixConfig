{ config, lib, inputs, pkgs, ... }: {

  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    desktopManager.cosmic.xwayland.enable = true;
    desktopManager.cosmic.showExcludedPkgsWarning = false;
    system76-scheduler.enable = true;
  };
  
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  environment.systemPackages = with pkgs; [
    gnome-disk-utility
  ];
   environment.cosmic.excludePackages = with pkgs; [ 
    cosmic-files
    cosmic-term
    cosmic-player
    cosmic-screenshot
   ];
  programs.kdeconnect = {
    enable = true;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-cosmic];
    config.common.default = "*";
  };

  programs.firefox.preferences = {
    # disable libadwaita theming for Firefox
    "widget.gtk.libadwaita-colors.enabled" = false;
  };

}
  