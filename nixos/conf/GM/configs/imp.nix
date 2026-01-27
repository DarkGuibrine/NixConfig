{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./cfsystem.nix
    ./nixhelper.nix
    ./nvidia.nix
    ./patchs.nix
  ];
}
