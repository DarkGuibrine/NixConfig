{ config, lib, inputs, pkgs, ... }: {

  programs.niri = {
    enable = true;
  };

  programs.dms-shell = {
  enable = true;
  #package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
  #quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;

  systemd = {
    enable = true;             # Systemd service for auto-start
    restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
  };

  plugins = {
    dankBitwarden.enable = true;
    #DankKDEConnect.enable = true;
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
    #inputs.dms-plugin-registry.modules.default
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "*";
  };

  security.polkit.enable = true;
  programs.xwayland.enable = true;
  programs.kdeconnect.enable = true;

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri"; 
  };

   services = {
    greetd =
      let
        session = {
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
    displayManager.autoLogin = {
      user = "gui";
      enable = true;
    };
  };

}  