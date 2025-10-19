{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./alias.nix
    ./fish.nix
    ./audio.nix
    ./idioma.nix
    ./nixhelper.nix
    ./flakeconfig.nix
    ./flatpak.nix
    ./nvidia.nix
    ./variables.nix
    ./wireless.nix
    ./zstd.nix
  ];
}
