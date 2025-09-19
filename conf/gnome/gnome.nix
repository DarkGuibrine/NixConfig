{ config, lib, inputs, pkgs, ... }: {

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Para desabilitar a instalação do conjunto de aplicativos do GNOME
  # e ficar apenas com o shell do GNOME.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];


  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.arc-menu
    gnomeExtensions.appindicator
    gnomeExtensions.valent
    xdg-desktop-portal-gnome
    valent
    gnome-tweaks
    gnome-shell
    gnome-extension-manager
    refine
    alacarte
    nautilus
  ];
    services.udev.packages = [ pkgs.gnome-settings-daemon ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.kdeconnect = {
  enable = true;
  package = pkgs.valent;
};  

}

