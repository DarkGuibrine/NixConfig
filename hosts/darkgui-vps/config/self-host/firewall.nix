{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  # Open ports in the firewall.
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [
      80
      443
      5335
      7777
    ];
    allowedTCPPorts = [
      5335
      7777
    ];
    trustedInterfaces = [ "tailscale0" "docker0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

}
