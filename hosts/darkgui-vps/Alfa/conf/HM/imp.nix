{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  imports = [
    ./configs/cfhome.nix
    ./pkgs/pkgs.nix
  ];
}
