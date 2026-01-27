{ config, lib, inputs, pkgs, ... }: {

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

  ## Configuração do gerenciador nix
  nix.package = pkgs.lixPackageSets.latest.lix;
  #nix.package = inputs.nixpkgs-master.legacyPackages.${pkgs.system}.lix;


   nix = {
    settings = {
      cores = 0;
      max-jobs = "auto";
      auto-optimise-store = true;
      extra-sandbox-paths = [ "/var/cache/ccache" ];


    ## ativaçao do flakes
      settings.experimental-features = ["nix-command" "flakes"];
      nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
      registry = lib.mapAttrs (_: value: {flake = value;}) (lib.filterAttrs (_: value: lib.isType "flake" value) inputs);
      settings.flake-registry = "";

    ## cache kernel
      substituters = [ "https://attic.xuyh0120.win/lantian" ];
      trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
    };
 };

   services = {
    flatpak = {
      enable = true;
    };
  };

}
