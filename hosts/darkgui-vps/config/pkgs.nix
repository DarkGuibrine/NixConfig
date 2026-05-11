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
    ookla-speedtest

    ## Git
    gitFull
    git

    ## Editor
    vim

    ## Dev
    nixd
    python3

    ## Segurança
    unbound
    dig
  ];
}
