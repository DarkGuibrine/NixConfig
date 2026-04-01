{ config, lib, inputs, pkgs, ... }: {

  ## tailscale
  services.tailscale = {
  enable = true;
  extraUpFlags = [ "--exit-node=100.121.29.98" "--exit-node-allow-lan-access=true" "--ssh" "--accept-dns=true" ];
  };
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 47984  47989  48910 ];
    allowedUDPPortRanges = [
     { from = 47998; to = 48000; }
     { from = 48002; to = 48010; } 
];
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  ## Configuraçao de Docker


  boot.kernel.sysctl = {
    "net.ipv4.ip_unprivileged_port_start" = 53;
    "net.ipv6.conf.all.forwarding" = true;
  };

  users.users.gui.extraGroups = [ "docker" ];
  users.groups.docker.gid = 131;
  virtualisation.docker = {
  enable = true;
  
  #rootless = {
  #  enable = true;
  #  setSocketVariable = true;
  #};
  };

  services.openssh = {
    enable = true;
  };
	
  services.sunshine = {
  enable = true;
  autoStart = true;
  capSysAdmin = true;
  openFirewall = true;
  
};

}
