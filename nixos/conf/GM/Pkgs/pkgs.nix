{ config, lib, inputs, pkgs, ... }: {

    ## Permitir pacotes não-livres
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
    ## Aplicativos sociais
    inputs.zen-browser.packages.${system}.default
    
    ## Utilitários do sistema e dev tools
    nh
    home-manager
    vulkan-tools
    vulkan-loader
    vulkan-utility-libraries
    gcc
    preload
    ethtool
    efibootmgr
    docker-compose 
    podman
    freerdp   
    dmidecode
    winboat
    gitFull
    kdePackages.partitionmanager
    
    ## inputs stable
    #inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}
    ];
}
