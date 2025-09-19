{ config, lib, inputs, pkgs, ... }: {
  
  ## distro box
  virtualisation.podman = {
  enable = true;
  #dockerCompat = true;
  };

  users.users.gui.extraGroups = [ "docker" ];
  users.groups.docker.gid = 131;
  virtualisation.docker = {
  enable = true;
  };
}
