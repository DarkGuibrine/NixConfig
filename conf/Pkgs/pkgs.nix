{ config, lib, inputs, pkgs, ... }: {

    ## Permitir pacotes não-livres
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
    ## Aplicativos sociais
    inputs.zen-browser.packages.${system}.default

    ## jogos
    lsfg-vk
    lsfg-vk-ui

    ## Utilitários do sistema e dev tools
    nh
    home-manager
    vulkan-tools-lunarg
    vulkan-loader
    vulkan-utility-libraries
    gcc
    preload
    ethtool
    kdePackages.partitionmanager
    winetricks
    wineWowPackages.staging
    kdePackages.qtmultimedia
    efibootmgr
    distrobox
    podman
    distroshelf

    ## repositorio 25.05
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.vulkan-tools
    ];

}

