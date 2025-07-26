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

  networking.hostName = "Alfa"; # Defina o nome da sua máquina

  ## Configuração da internet
  networking.networkmanager.enable = true;
  networking.interfaces.enp9s0.wakeOnLan.enable = true;

  ## Ativar Bluetooth
  hardware.bluetooth.enable = true;

  ## Definir fuso horário
  time.timeZone = "America/Bahia";

  ## Configurações de idioma e localidade
  i18n.defaultLocale = "pt_BR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  ## Ativar sistema gráfico X11
  services.xserver.enable = true;

  ## Configurar layout do teclado no X11 e console
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  console.keyMap = "br-abnt2";

  ## Ativar CUPS para impressão
  services.printing.enable = true;

  ## Definição do usuário normal
  users.users.gui = {
    isNormalUser = true;
    description = "Gui";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      # thunderbird (descomente se quiser usar)
    ];
  };

  ## Habilitar login automático para o usuário "gui"
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "gui";

  ## Permitir pacotes não-livres
  nixpkgs.config.allowUnfree = true;

  ## Kernel customizado
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  ## versao do nix
  system.stateVersion = "25.11";
}
