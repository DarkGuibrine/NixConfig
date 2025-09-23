{ config, lib, inputs, pkgs, ... }: {

    programs.fish.shellAliases = {
    # upd = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake path:/etc/nixos#Alfa";
    upd = "nh os switch -a -u && nh home switch -a -u";
    updhome = "nh home switch -a -u";
    updsystem = "nh os switch -a -u";
    nixcf = "kate /etc/nixos/configuration.nix";
    nixfk = "kate /etc/nixos/flake.nix";
    nixpkg = "kate /etc/nixos/conf/Pkgs/pkgs.nix";
    nixalias = "kate /etc/nixos/conf/Alias/alias.nix";
    };
}