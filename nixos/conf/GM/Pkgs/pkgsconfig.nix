{ config, lib, inputs, pkgs, ... }: {

  
  ## configuraçao da steam
  programs = {
    steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    };
    gamescope.enable = true;
    gamemode.enable = true;
  };



  ## Configuraçoes do obs

  programs.obs-studio = {
    enable = true;
    # optional Nvidia hardware acceleration
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
    ];
   #enableVirtualCamera = true;
  };

  ## Configuraçoes do LACT
  environment.systemPackages = with pkgs; [lact];
  systemd.services.lact = {
    description = "GPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };

  ## Configuraçao de Docker

  #virtualisation.podman = {
  #enable = true;
  #dockerCompat = true;
  #};

  users.users.gui.extraGroups = [ "docker" ];
  users.groups.docker.gid = 131;
  virtualisation.docker = {
  enable = true;
  };

  ## Fontes
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.ubuntu-mono
  nerd-fonts.ubuntu-sans
  nerd-fonts.dejavu-sans-mono
  nerd-fonts.fira-code
  nerd-fonts.overpass
  noto-fonts
  liberation_ttf
  dejavu_fonts
  ];

  ## OpenRGB
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    package = pkgs.openrgb-with-all-plugins; # enable all plugins
  };
}   