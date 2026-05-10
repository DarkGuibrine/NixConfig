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
    zerotierone

    ## Git
    gitFull
    git

    ## Editor
    vim

    ## Dev
    nixd
    python3
  ];
}
