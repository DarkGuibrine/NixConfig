{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./configs/cfhome.nix
    ./kitty/kitty.nix
    ./pkgs/pkgs.nix
  ];
}
