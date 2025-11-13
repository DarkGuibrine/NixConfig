{ config, lib, inputs, pkgs, ... }: {

  nix = {
    ## ativar flakes
    settings.experimental-features = ["nix-command" "flakes"];
    ## chaotic-nix
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
    registry = lib.mapAttrs (_: value: {flake = value;}) (lib.filterAttrs (_: value: lib.isType "flake" value) inputs);
    settings.flake-registry = "";
  };
}
