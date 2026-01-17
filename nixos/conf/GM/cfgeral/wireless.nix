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

}
