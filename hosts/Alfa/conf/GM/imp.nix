{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./configs/imp.nix
    ./DE/impde.nix
    ./Pkgs/imp_pkgs.nix
  ];
}
