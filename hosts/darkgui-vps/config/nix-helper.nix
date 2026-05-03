{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  programs = {
    ## nh
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 8d --keep 7";
      flake = "/etc/nixos"; # sets NH_OS_FLAKE variable for you
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [ ];
    };
  };

  nix.package = pkgs.lixPackageSets.stable.lix;

}
