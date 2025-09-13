{ config, lib, inputs, pkgs, ... }: {
    ## pacotes home-manager
    home.packages = with pkgs; [
    
    ## aplicativos sociais
    (discord.override {withVencord = true;})
    telegram-desktop

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

    ## Utilitários do sistema e dev tools
    fastfetch
    cpu-x
    git
    btop-cuda
    vscode
    flatpak
    appimage-run
    wget
    lact
    kitty

    ];
}