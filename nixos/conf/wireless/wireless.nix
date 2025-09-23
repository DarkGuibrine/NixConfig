{ config, lib, inputs, pkgs, ... }: {

  ## Configuração da internet
  networking.networkmanager.enable = true;
  networking.interfaces.enp9s0.wakeOnLan.enable = true;

  ## Ativar Bluetooth
  hardware.bluetooth.enable = true;

  ## Ativar CUPS para impressão
  services.printing.enable = true;

}
