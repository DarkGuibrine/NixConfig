{ config, lib, inputs, pkgs, ... }: {

  ## Ativar recursos experimentais do Nix, como flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

    ## chaotic-nix
  nix.nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
  nix.registry = lib.mapAttrs (_: value: {flake = value;}) (lib.filterAttrs (_: value: lib.isType "flake" value) inputs);
  nix.settings.flake-registry = "";

}
