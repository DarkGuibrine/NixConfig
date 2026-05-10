{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  programs = {
    ## nix-ld
    nix-ld = {
      enable = true;
      libraries = with pkgs; [ ];
    };
    ## nh
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 8d --keep 7";
      flake = "/etc/nixos"; # sets NH_OS_FLAKE variable for you
    };
    ## appimage
    appimage = {
      enable = true;
      binfmt = true;
    };
    ## Cache
    ccache.enable = true;
    ccache.cacheDir = "/var/cache/ccache";

  };

  nix = {
    settings = {
      cores = 0;
      max-jobs = "auto";
      auto-optimise-store = true;
      extra-sandbox-paths = [ "/var/cache/ccache" ];

      ## Ativaçao flakes
      flake-registry = "";
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      ## cache
      substituters = [
        "https://cache.garnix.io"
        "https://niri.cachix.org/" # niri
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" # niri
      ];
    };

    ## Lix
    package = pkgs.lixPackageSets.latest.lix;

    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
    registry = lib.mapAttrs (_: value: { flake = value; }) (
      lib.filterAttrs (_: value: lib.isType "flake" value) inputs
    );
  };

  # chaotic
  chaotic.nyx = {
    cache.enable = true;
    overlay.enable = true;
  };

  services.printing.enable = false;
  services = {
    flatpak = {
      enable = true;
    };
  };

  nixpkgs.config = {
    problems.handlers = {
      cups.broken = "warn";
    };
  };

}
