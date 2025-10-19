{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./cfgeral/impcf.nix
    ./DE/impde.nix
    ./Pkgs/imp_pkgs.nix
  ];
}
