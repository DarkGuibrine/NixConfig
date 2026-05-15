{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  imports = [
    ./pkgs.nix
    ./nix-helper.nix
    ./self-host/self-host.nix
    ./self-host/firewall.nix
    ];
}
