{ config, lib, inputs, pkgs, ... }: {

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri  = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  programs.dms-shell = {
  enable = true;
  package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
  quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;

  systemd = {
    enable = true;             # Systemd service for auto-start
    restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
  };

  plugins = {
    #dankBitwarden.enable = true;
    dankKDEConnect.enable = true;
    linuxWallpaperEngine.enable = true;
  };
  
  # Core features
  enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  enableVPN = true;                  # VPN management widget
  enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  enableAudioWavelength = true;      # Audio visualizer (cava)
  enableCalendarEvents = true;       # Calendar integration (khal)
};

  imports = [
    ./thunar.nix
    inputs.dms.nixosModules.dank-material-shell
    inputs.dms-plugin-registry.modules.default
    inputs.dms.nixosModules.greeter
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "*";
  };

  security.polkit.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;
  programs.xwayland.enable = true;
  programs.kdeconnect.enable = true;

  #services.displayManager.dms-greeter = {
  #  enable = true;
  #  compositor.name = "hyprland";
  #  package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
  #  quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
  #};

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


}