{ config, lib, inputs, pkgs, ... }: {

    ## Permitir pacotes não-livres
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
    ## Aplicativos sociais
    bitwarden-desktop

    ## inputs
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
    inputs.hayase.packages.${pkgs.stdenv.hostPlatform.system}.default 
    #inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.proton-cachyos_x86_64_v3

    ## Utilitários do sistema e dev tools
    nh
    home-manager
    vulkan-tools
    vulkan-loader
    vulkan-utility-libraries
    gcc
    ethtool
    efibootmgr
    docker-compose 
    podman
    distroshelf
    distrobox
    freerdp   
    dmidecode
    i2c-tools
    #winboat
    gitFull
    kdePackages.partitionmanager
    usbutils
    openrgb
    winetricks
    wineWowPackages.staging
    haguichi
    logmein-hamachi
    zerotierone
    kdePackages.ark
    
    ## inputs stable
    #inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}
    ];

    programs.gpu-screen-recorder.enable = true;
    services.logmein-hamachi.enable = true;
    programs.haguichi.enable = true;
    
}
