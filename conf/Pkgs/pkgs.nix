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
    kdePackages.filelight
    kdePackages.dolphin
    kdePackages.ark
    xdg-desktop-portal-gnome
    winetricks
    wineWowPackages.staging
    kdePackages.qtmultimedia
    efibootmgr
    distrobox
    docker-compose 
    podman
    distroshelf
    freerdp
    kdePackages.krfb    
    dmidecode
    inputs.winboat.packages.x86_64-linux.default
    gitFull

    ## repositorio 25.05
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.vulkan-tools
    ];

}

