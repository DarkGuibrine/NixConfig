{ config, lib, inputs, pkgs, ... }:
{
  imports =
    [ # Importa a configuração de hardware detectada
      ./hardware-configuration.nix
      ./conf/GM/imp.nix
    ];
    
  ## Configuração do bootloader
  boot = {
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_cachyos;
    kernelPackages = inputs.nix-cachyos-kernel.legacyPackages.x86_64-linux.linuxPackages-cachyos-latest-lto;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.configurationLimit = 10;
  };

  networking.hostName = "Alfa"; # Defina o nome da sua máquina

  services = {
    xserver.enable = false; # Ativar sistema gráfico X11
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "gui";
    printing.enable = false;
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
