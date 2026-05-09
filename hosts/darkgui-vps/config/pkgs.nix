{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ## CLI
    curl
    wget
    screen
    fish
    btop
    fastfetch
    unzip
    unrar

    ## Git
    gitFull

    ## Editor
    vim

    ## Nix
    nixd
  ];
}
