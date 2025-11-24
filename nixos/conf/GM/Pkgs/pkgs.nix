{ config, lib, inputs, pkgs, ... }: {

    ## Permitir pacotes não-livres
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
    ## Aplicativos sociais
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
    inputs.hayase.packages.${pkgs.stdenv.hostPlatform.system}.default 
    bitwarden-desktop

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
    distroshelf
    distrobox
    freerdp   
    dmidecode
    #winboat
    gitFull
    kdePackages.partitionmanager
    usbutils
    openrgb
    winetricks
    wineWowPackages.staging

    ## inputs stable
    #inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}
    ];

    programs.gpu-screen-recorder.enable = true;
    
}
