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
  nix.package = pkgs.lixPackageSets.latest.lix;
  #nix.package = inputs.nixpkgs-master.legacyPackages.${pkgs.system}.lix;


   nix = {
    settings = {
      cores = 0;
      max-jobs = "auto";
      auto-optimise-store = true;
      extra-sandbox-paths = [ "/var/cache/ccache" ];

      ## cache kernel
      substituters = [ "https://attic.xuyh0120.win/lantian" ];
      trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
    };
 };
   programs = { 
    ccache.enable = true;
    ccache.cacheDir = "/var/cache/ccache";
  };

}
