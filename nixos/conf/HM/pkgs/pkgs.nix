{ config, lib, inputs, pkgs, ... }: {
    ## pacotes home-manager
    home.packages = with pkgs; [
    
    ## aplicativos sociais
    telegram-desktop
    youtube-music
    (discord.override {withEquicord = true;})

    ## Jogos
    lutris
    heroic
    prismlauncher
    steam
    ryubing
    xclicker
    mangojuice
    mangohud
    protonplus
    hydralauncher

    ## Utilitários do sistema e dev tools
    fastfetch
    cpu-x
    git
    btop-cuda
    vscodium
    flatpak
    appimage-run
    wget
    lact
    kitty
    vlc
    tree
    python3
    unrar
    droidcam
    gpart

    ];
    
}