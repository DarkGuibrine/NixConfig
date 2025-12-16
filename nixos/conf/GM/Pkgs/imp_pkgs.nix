{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./distrobox.nix
    ./pkgs.nix
    ./steam.nix
    ./lact.nix
    ./obs.nix
    ./thunar.nix
  ];
}
