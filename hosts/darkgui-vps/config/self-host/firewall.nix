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
    allowedUDPPorts = [
      config.services.tailscale.port
      53
      5300
      7777
      40000
    ];
    extraCommands = ''
      iptables -A PREROUTING -t nat -i eth0 -p TCP --dport 80 -j REDIRECT --to-port 8000
      iptables -A PREROUTING -t nat -i eth0 -p TCP --dport 53 -j REDIRECT --to-port 5300
      iptables -A PREROUTING -t nat -i eth0 -p UDP --dport 53 -j REDIRECT --to-port 5300
    '';
  };

}
