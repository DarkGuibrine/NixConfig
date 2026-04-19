{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
    wget
    screen
    fish
    btop
    fastfetch
    gitFull
    unrar
    unzip

    ## Zed
    nixd
    nil
  ];

}
