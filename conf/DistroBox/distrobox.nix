{ config, lib, inputs, pkgs, ... }: {
  
  ## distro box
  virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  };
}
