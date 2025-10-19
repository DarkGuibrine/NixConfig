{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./Fontes/fontes.nix
    ./git/git.nix
    ./kitty/kitty.nix
    ./pkgs/pkgs.nix
  ];
}
