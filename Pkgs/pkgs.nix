{ config, lib, inputs, pkgs, ... }: {

    ## Permitir pacotes não-livres
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
    ## Aplicativos sociais
    zapzap
    inputs.zen-browser.packages.${system}.default
    (discord.override {withVencord = true;})

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
