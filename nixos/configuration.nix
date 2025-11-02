{ config, lib, inputs, pkgs, ... }:
{
  imports =
    [ # Importa a configuração de hardware detectada
      ./hardware-configuration.nix
      ./imp.nix
    ];
    
  ## Configuração do bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 10;
  };

  boot.kernelPackages = pkgs.linuxPackages_cachyos;  # Kernel customizado
  #boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux_cachyos;
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Alfa"; # Defina o nome da sua máquina

  services = {
    xserver.enable = false; # Ativar sistema gráfico X11
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "gui";
  };

  ## Definição do usuário normal
  users.users.gui = {
    isNormalUser = true;
    description = "Gui";
    extraGroups = [ "networkmanager" "wheel"];
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
  
  system.stateVersion = "25.05";  # versao do nix
}
