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
};

  ## Configuração do gerenciador nix
  #nix.package = pkgs.lixPackageSets.latest.lix;
  #nix.package = inputs.nixpkgs-master.legacyPackages.${pkgs.system}.lix;

  ## compilaçao

   nix = {
    settings = {
      cores = 0;
      max-jobs = "auto";
      auto-optimise-store = true;
    };
 };
   programs = { 
    ccache.enable = true;
    ccache.cacheDir = "/var/cache/ccache";
  };
  nix.settings.extra-sandbox-paths = [ "/var/cache/ccache" ];

}
