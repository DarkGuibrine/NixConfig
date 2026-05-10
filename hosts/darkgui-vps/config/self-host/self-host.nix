{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

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

  boot.kernel.sysctl = {
    "net.ipv4.ip_unprivileged_port_start" = 53;
    "net.ipv6.conf.all.forwarding" = true;
  };

  users.groups.docker.gid = 131;
  virtualisation.docker = {
    enable = true;
  };

  services.tailscale = {
    enable = true;
    extraUpFlags = [
      "--ssh"
      "--accept-dns=true"
      "--advertise-exit-node"
    ];
  };

  services.unbound = {
    enable = true;
    settings = {
      server = {
        verbosity = 0;
        interface = [ "127.0.0.1" ];
        port = 5335;

        do-ip4 = "yes";
        do-udp = "yes";
        do-tcp = "yes";
        do-ip6 = "no";
        prefer-ip6 = "no";

        harden-glue = "yes";
        harden-dnssec-stripped = "yes";
        use-caps-for-id = "no";
        edns-buffer-size = 1232;
        prefetch = "yes";
        num-threads = 1;
        so-rcvbuf = "1m";

        private-address = [
          "192.168.0.0/16"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "10.0.0.0/8"
          "fd00::/8"
          "fe80::/10"
          "100.0.0.0/8"
        ];
      };
    };
  };

}
