{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  ## pacotes home-manager
  home.packages = with pkgs; [
    ## Comunicação / social
    telegram-desktop
    pear-desktop
    teams-for-linux
    (discord.override { withEquicord = true; })
    jellyfin-desktop

    ## Jogos
    faugus-launcher
    heroic
    prismlauncher
    adwsteamgtk
    ryubing
    xclicker
    goverlay
    mangohud
    protonplus
    hydralauncher
    lsfg-vk
    lsfg-vk-ui

    ## Desenvolvimento
    zed-editor
    vscodium
    nil
    nixd
    nodejs
    python3
    godot

    ## Terminal / CLI
    kitty
    fastfetch
    btop-cuda
    tree
    wget
    git
    unrar

    ## Multimídia
    vlc
    qbittorrent
    easyeffects
    flameshot
    motrix

    ## Sistema
    cpu-x
    mission-center
    droidcam
    anydesk

    ## Temas / aparência
    lxappearance
    nwg-look
    kdePackages.qt6ct
    libsForQt5.qt5ct
    gnome-themes-extra
    papirus-icon-theme
  ];
}
