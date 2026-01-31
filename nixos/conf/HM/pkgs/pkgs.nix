{ config, lib, inputs, pkgs, ... }: {
    ## pacotes home-manager
    home.packages = with pkgs; [
    
    ## aplicativos sociais
    telegram-desktop
    pear-desktop
    element-desktop
    #(discord.override { withEquicord = true; })
    equibop

    ## Jogos
    lutris
    faugus-launcher
    heroic
    prismlauncher
    steam
    ryubing
    xclicker
    #mangojuice
    goverlay
    mangohud
    protonplus
    hydralauncher
    lsfg-vk
    lsfg-vk-ui

    ## Utilitários do sistema e dev tools
    fastfetch
    flameshot
    #handbrake
    easyeffects
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
    mission-center
    nodejs
    lxappearance

    ];

}