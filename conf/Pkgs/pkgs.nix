{ config, lib, inputs, pkgs, ... }: {

     environment.systemPackages = with pkgs; [
    ## Aplicativos sociais
    vesktop
    zapzap
    inputs.zen-browser.packages.${system}.default

    ## Jogos
    lutris-free
    heroic
    protonplus
    prismlauncher
    steam
    xclicker

    ## Utilitários do sistema e dev tools
    nh
    fastfetch
    git
    btop
    umu-launcher
    mangohud
    goverlay
    ethtool
    wineWowPackages.staging
    gamemode
    gamescope
    vulkan-tools
    appimage-run
    wget
    kdePackages.partitionmanager
    winetricks
  ];

}
