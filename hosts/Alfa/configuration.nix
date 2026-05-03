{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    # Importa a configuração de hardware detectada
    ./hardware-configuration.nix
    ./conf/GM/imp.nix
  ];

  ## Configuraçãao do bootloader
  boot = {
    #kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_cachyos-lto;
    #kernelPackages = inputs.nix-cachyos.legacyPackages.x86_64-linux.linuxPackages-cachyos-latest-lto-x86_64-v3;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.configurationLimit = 10;
  };

  networking.hostName = "Alfa"; # Defina o nome da sua máquina

  services = {
    xserver.enable = false; # Ativar sistema gráfico X11
    printing.enable = false;
  };

  ## Definição do usuário normal
  users.users.gui = {
    isNormalUser = true;
    description = "Gui";
    extraGroups = [
      "networkmanager"
      "wheel"
      "tailscale"
      "docker"
    ];
    packages = with pkgs; [ ];
  };

  ## sudo-rs
  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
    };
  };

  system.stateVersion = "25.11"; # versao do nix

  networking = {
    networkmanager.enable = true;
    interfaces.enp9s0.wakeOnLan.enable = true;
    firewall.allowedTCPPorts = [ ];
    firewall.allowedUDPPorts = [
    ];
  };
  services = {
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "gui";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
