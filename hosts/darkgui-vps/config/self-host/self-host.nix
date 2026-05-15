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


  boot.kernel.sysctl = {
    "net.ipv4.ip_unprivileged_port_start" = 53;
    "net.ipv6.conf.all.forwarding" = true;
    "net.ipv6.conf.default.forwarding" = true;
  };

  users.groups.docker.gid = 131;
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
        ipv6 = true;
        fixed-cidr-v6 = "fd00:db8:1::/64";
        ip6tables = true;
        experimental = true;
      };
  };

  services.tailscale = {
    enable = true;
    extraUpFlags = [
      "--ssh"
      "--accept-dns=true"
      "--advertise-exit-node"
    ];
  };

}
