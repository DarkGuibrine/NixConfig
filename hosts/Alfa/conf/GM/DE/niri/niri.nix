{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  imports = [
    ./thunar.nix
    #./dms.nix
    ./noctalia.nix
    inputs.niri.nixosModules.niri
  ];

  services.dbus.enable = true;
  security.polkit.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;
  programs.xwayland.enable = true;
  programs.kdeconnect.enable = true;

  services = {
    greetd =
      let
        session = {
          #command = "${pkgs.hyprland}/bin/Hyprland";
          command = "${pkgs.niri}/bin/niri-session";
          user = "gui";
        };
      in
      {
        enable = true;
        settings = {
          terminal.vt = 1;
          default_session = session;
          initial_session = session;
        };
      };
  };

  environment.systemPackages = with pkgs; [
    dgop
  ];

  #systemd.user.services.polkit-gnome-authentication-agent-1 = {
  #description = "polkit-gnome-authentication-agent-1";
  #wantedBy = [ "graphical-session.target" ];
  #after = [ "graphical-session.target" ];
  #serviceConfig = {
  #  Type = "simple";
  #  ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #  Restart = "on-failure";
  #  RestartSec = 1;
  #  TimeoutStopSec = 10;
  #};
  #};

  #xdg.portal = {
  #  enable = true;
  #  config = {
  #    niri."org.freedesktop.impl.portal.FileChooser" = "gtk";
  #    niri.default = "gnome";
  #    common.default = "gnome";
  #    obs.default = "gnome";
  #  };
  #  extraPortals = with pkgs; [
  #    xdg-desktop-portal-gnome
  #    xdg-desktop-portal-gtk
  #  ];
  #};

  #xdg.portal = {
  # enable = true;
  # extraPortals = [
  #   pkgs.xdg-desktop-portal-gnome
  #   pkgs.xdg-desktop-portal-gtk
  #   pkgs.xdg-desktop-portal-wlr
  #   ];
  # config.common.default = "*1";
  #};

}
