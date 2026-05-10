{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    preload-ng.url = "github:miguel-b-p/preload-ng";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    disko.url = "github:nix-community/disko";
    nyx-loner.url = "github:lonerOrz/nyx-loner";
    home-manager.url = "github:nix-community/home-manager/";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    shiru.url = "github:darkguibrine/shiru-nix";
    hayase.url = "github:darkguibrine/hayase-nix";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    niri.url = "github:sodiboo/niri-flake";
    quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
  };
  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      home-manager,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosConfigurations = {
          # PC
          "Alfa" = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/Alfa/configuration.nix
              ./mods/nixos/nixos.nix
            ];
          };
          # VPS
          "darkgui-vps" = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/darkgui-vps/configuration.nix
            ];
          };
        };
        # Home Manager
        homeConfigurations = {
          "gui@Alfa" = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            extraSpecialArgs = { inherit inputs; };
            modules = [
              ./hosts/Alfa/home.nix
              ./mods/home/home.nix
            ];
          };
        };
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        perSystem =
          { config, pkgs, ... }:
          {

          };
      };
    };
}
