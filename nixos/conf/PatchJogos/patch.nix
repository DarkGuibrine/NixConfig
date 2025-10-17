{ config, lib, inputs, pkgs, ... }: {

    ## Config da steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  nixpkgs.config.allowUnfreePredicate = pkg: lib.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];

  ## patch jogos
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
  };

  ## LACT
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
}
