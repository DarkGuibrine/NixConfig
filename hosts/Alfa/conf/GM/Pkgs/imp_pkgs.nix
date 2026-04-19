{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  imports = [
    ./pkgsconfig.nix
    ./pkgs.nix
  ];
}
