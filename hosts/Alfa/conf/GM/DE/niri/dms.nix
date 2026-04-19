{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  programs.dms-shell = {
    enable = true;
    package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
    #quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };

    plugins = {
      dankBitwarden.enable = true;
      dankKDEConnect.enable = true;
      linuxWallpaperEngine.enable = true;
      nvidiaGpuMonitor.enable = true;
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = false; # Calendar integration (khal)
  };

  imports = [
    inputs.dms.nixosModules.dank-material-shell
    inputs.dms-plugin-registry.modules.default
    inputs.dms.nixosModules.greeter
  ];

}
