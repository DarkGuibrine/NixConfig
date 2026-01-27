{ config, lib, inputs, pkgs, ... }: {

  ## Configuração da internet
  networking = {
    networkmanager.enable = true;
    interfaces.enp9s0.wakeOnLan.enable = true;
    firewall.allowedTCPPorts = [ ];
    firewall.allowedUDPPorts = [
    ];
  };
  ## Ativar Bluetooth
  hardware.bluetooth.enable = true;

  ## Configuração de áudio
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true; # Descomente se usar aplicações JACK
   };
  };
  security.rtkit.enable = true;

  ## Configuraçao de idioma 
  
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
  ## Configurar layout do teclado no X11 e console
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  console.keyMap = "br-abnt2";

  ## Alias do fish
  programs.fish.shellAliases = {
    # upd = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake path:/etc/nixos#Alfa";
    upd = "nh home switch -a -u && nh os switch -a";
    gitupdate = "git add . && git commit && git push origin main";
  };

  ## Config do fish
  programs.fish.enable = true;  
  programs.bash = {
  interactiveShellInit = 
  '' if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi '';
 };
}
