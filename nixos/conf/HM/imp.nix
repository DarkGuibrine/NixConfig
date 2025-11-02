{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./Fontes/fontes.nix
    ./git/git.nix
    ./kitty/kitty.nix
    ./pkgs/imp_pkgs.nix
    ./shell/fish.nix
    ./shell/starship.nix
  ];
}
