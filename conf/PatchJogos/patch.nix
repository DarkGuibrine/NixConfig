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
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  ## lsfg-vk
  services.lsfg-vk = {
  enable = true;
  ui.enable = true;
};
}
