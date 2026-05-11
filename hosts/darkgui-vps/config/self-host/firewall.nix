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
    enable = true;
    allowedTCPPorts = [
      22
      80
      81
      443
      3000
      5335
      7777
      9000
      11000
    ];
    trustedInterfaces = [ "tailscale0" "docker0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

}
