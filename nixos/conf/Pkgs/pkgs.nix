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
    winetricks
    wineWowPackages.staging
    efibootmgr
    docker-compose 
    podman
    freerdp    
    dmidecode
    inputs.winboat.packages.${system}.winboat
    gitFull
    kdePackages.partitionmanager
    

    ## repositorio 25.05
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.vulkan-tools

    ## repositorio chaotic
    #inputs.chaotic.packages.${pkgs.system}.proton-cachyos_x86_64_v3
    ];
}
