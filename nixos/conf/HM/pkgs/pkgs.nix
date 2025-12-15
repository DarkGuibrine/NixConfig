{ config, lib, inputs, pkgs, ... }: {
    ## pacotes home-manager
    home.packages = with pkgs; [
    
    ## aplicativos sociais
    telegram-desktop
    youtube-music
    element-desktop
    (discord.override {withEquicord = true;})

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
    handbrake
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
    #droidcam
    motrix
    ];


}