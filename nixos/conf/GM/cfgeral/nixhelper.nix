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

}

