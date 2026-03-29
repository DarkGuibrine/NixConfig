{ config, lib, inputs, pkgs, ... }: {

   imports = [
    #./cosmic.nix
    #./gnome.nix
    #./kde.nix
    ./niri/niri.nix
  ];

}
