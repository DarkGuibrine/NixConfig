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
    ];
    allowedUDPPortRanges = [
      {
        from = 47998;
        to = 48000;
      }
      {
        from = 48002;
        to = 48010;
      }
    ];
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

}
