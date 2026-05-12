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

}
