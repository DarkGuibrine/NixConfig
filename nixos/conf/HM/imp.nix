{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./config/cfhome.nix
    ./kitty/kitty.nix
    ./pkgs/pkgs.nix
  ];
}
