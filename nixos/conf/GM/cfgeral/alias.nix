{ config, lib, inputs, pkgs, ... }: {

    programs.fish.shellAliases = {
    # upd = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake path:/etc/nixos#Alfa";
    upd = "nh home switch -a -u && nh os switch -a";
    updhome = "nh home switch -a -u";
    updsystem = "nh os switch -a -u";
    gitupdate = "git add . && git commit && git push origin main";
    };
}