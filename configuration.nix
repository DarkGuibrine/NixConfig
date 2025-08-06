{ config, lib, inputs, pkgs, ... }:
{
  imports =
    [ # Importa a configuração de hardware detectada
      ./hardware-configuration.nix
      ./imp.nix
    ];
  ## Configuração do bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;  # Kernel customizado

  networking.hostName = "Alfa"; # Defina o nome da sua máquina

  services.xserver.enable = true;   # Ativar sistema gráfico X11

  ## Definição do usuário normal
  users.users.gui = {
    isNormalUser = true;
    description = "Gui";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.kcalc
    ];
  };

  ## Habilitar login automático para o usuário "gui"
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "gui";

  system.stateVersion = "25.05";  # versao do nix

  security.sudo.package = pkgs.sudo.override {withInsults = true;}; ## errou sudo xingando
}
