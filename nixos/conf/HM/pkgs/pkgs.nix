{ config, lib, inputs, pkgs, ... }: {
    ## pacotes home-manager
    home.packages = with pkgs; [
    
    ## aplicativos sociais
    telegram-desktop
    youtube-music
    element-desktop
    (discord.override {withEquicord = true;})
    #inputs.chaotic.legacyPackages.${pkgs.stdenv.hostPlatform.system}.proton-cachyos_x86_64_v3

    ## Jogos
    lutris
    faugus-launcher
    heroic
    prismlauncher
    steam
    ryubing
    xclicker
    mangojuice
    mangohud
    protonplus
    hydralauncher
    lsfg-vk
    lsfg-vk-ui

    ## Utilitários do sistema e dev tools
    fastfetch
    myxer
    qbittorrent
    cpu-x
    git
    btop-cuda
    vscodium
    flatpak
    wget
    kitty
    vlc
    tree
    python3
    unrar
    droidcam
    ];


}