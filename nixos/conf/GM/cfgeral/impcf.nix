{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./alias.nix
    ./audio.nix
    ./idioma.nix
    ./nixhelper.nix
    ./flakeconfig.nix
    ./flatpak.nix
    ./nvidia.nix
    ./variables.nix
    ./wireless.nix
    ./zstd.nix
    ./fish.nix
    ./kernel.nix
    ./udev.nix
  ];
}
