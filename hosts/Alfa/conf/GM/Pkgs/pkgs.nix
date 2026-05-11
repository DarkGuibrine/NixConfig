{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  ## Permitir pacotes não-livres
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ## Navegadores
    inputs.zen-browser.packages.${pkgs.system}.default

    ## Streaming / mídia
    inputs.shiru.packages.${pkgs.system}.default
    inputs.hayase.packages.${pkgs.system}.default
    linux-wallpaperengine

    ## Segurança / rede
    bitwarden-desktop
    tailscale
    zerotierone
    cloudflared
    sunshine
    ookla-speedtest

    ## Remote desktop
    freerdp
    kdePackages.krdp

    ## Containers
    docker-compose
    distrobox
    distroshelf

    ## Desenvolvimento
    gcc
    gnumake
    gitFull
    nh
    home-manager
    lazygit

    ## Vulkan / gráficos
    vulkan-tools
    vulkan-utility-libraries

    ## Wine
    wine-staging
    winetricks
    winboat

    ## Sistema
    efibootmgr
    ethtool
    dmidecode
    i2c-tools
    usbutils
    xwayland-satellite
    android-tools

    ## KDE / utilitários
    kdePackages.partitionmanager
    kdePackages.ark
    loupe
    onlyoffice-desktopeditors

    ## Temas Qt
    adwaita-qt
    adwaita-qt6

    ## RGB
    openrgb

    ## Hamachi
    haguichi
    logmein-hamachi
  ];
  programs.gpu-screen-recorder.enable = true;
  services.logmein-hamachi.enable = true;
  programs.haguichi.enable = true;

  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig;
  programs.sleepy-launcher.enable = true;
  programs.anime-game-launcher.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
  ];

}
