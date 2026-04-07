{ config, lib, inputs, pkgs, ... }: {
    ## pacotes home-manager
    home.packages = with pkgs; [
    
    ## aplicativos sociais
    telegram-desktop
    pear-desktop
    stoat-desktop
    teams-for-linux
    #(discord.override {withVencord = true;})
    (discord.override {withEquicord = true;})
    jellyfin-desktop

    ## Jogos
    lutris
    faugus-launcher
    heroic
    prismlauncher
    steam
    adwsteamgtk
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
    python314
    unrar
    droidcam
    motrix
    mission-center
    nodejs
    lxappearance
    nwg-look
    #rustdesk
    anydesk
    libargon2
    openssl_oqs

    ## Dev

    ];

    nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
    ];
}