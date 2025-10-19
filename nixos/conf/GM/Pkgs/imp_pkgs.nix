{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./distrobox.nix
    ./lact.nix
    ./obs.nix
    ./pkgs.nix
    ./steam.nix
  ];
}
