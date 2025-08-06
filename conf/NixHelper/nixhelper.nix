{ config, lib, inputs, pkgs, ... }: {

  ## nixLD
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [];

  ## nixNH
  programs.nh = {
  enable = true;
  clean.enable = true;
  clean.extraArgs = "--keep-since 4d --keep 3";
  flake = "/etc/nixos"; # sets NH_OS_FLAKE variable for you
  };

  ## Configuração do gerenciador nix
  nix.package = pkgs.lixPackageSets.latest.lix;

}
