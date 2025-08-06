{ config, lib, inputs, pkgs, ... }: {

    ## Permitir pacotes não-livres
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
    ## Aplicativos sociais
    zapzap
    inputs.zen-browser.packages.${system}.default
    (discord.override {withVencord = true;})

    ## Jogos
    lutris
    heroic
    prismlauncher
    steam
    xclicker
    mangojuice
    mangohud
    inputs.nixpkgs-master.legacyPackages.${pkgs.system}.lsfg-vk
    inputs.nixpkgs-master.legacyPackages.${pkgs.system}.lsfg-vk-ui

    ## Utilitários do sistema e dev tools
    nh
    vscode
    cpu-x
    flatpak
    vulkan-tools-lunarg
    vulkan-loader
    vulkan-utility-libraries
    fastfetch
    git
    btop
    ethtool
    appimage-run
    wget
    gcc
    kdePackages.partitionmanager
    winetricks
    wineWowPackages.staging

    ## repositorio 25.05
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.vulkan-tools
    ];
}

