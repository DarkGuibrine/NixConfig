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
    ## Aplicativos sociais
    bitwarden-desktop
    sunshine
    tailscale

    ## inputs
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
    inputs.shiru.packages.${pkgs.stdenv.hostPlatform.system}.default

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
    distroshelf
    distrobox
    freerdp
    dmidecode
    i2c-tools
    gitFull
    kdePackages.partitionmanager
    usbutils
    openrgb
    winetricks
    #wineWowPackages.staging
    wine
    haguichi
    logmein-hamachi
    zerotierone
    kdePackages.ark
    loupe
    lazygit
    gnumake
    onlyoffice-desktopeditors
    adwaita-qt
    adwaita-qt6
    winboat
    xwayland-satellite
    linux-wallpaperengine
    #kdePackages.polkit-qt-1
    kdePackages.krdp
    cloudflared

    ## inputs stable
    #inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}
  ];

  programs.gpu-screen-recorder.enable = true;
  services.logmein-hamachi.enable = true;
  programs.haguichi.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
  ];

}
