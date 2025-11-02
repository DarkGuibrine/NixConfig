{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    home-manager = {
     url = "github:nix-community/home-manager/";
     inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
     url = "github:nix-community/NUR";
     inputs.nixpkgs.follows = "nixpkgs";
     };
    zen-browser = {
     url = "github:0xc000022070/zen-browser-flake";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self ,nixpkgs ,nixpkgs-stable ,nixpkgs-master ,home-manager ,chaotic ,zen-browser ,nur ,aagl , ...} @ inputs: {
    nixosConfigurations = {
      "Alfa" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          chaotic.nixosModules.default
          nur.modules.nixos.default
          {imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true;
          programs.sleepy-launcher.enable = true;
          }
        ];
    };
      };
      homeConfigurations."gui@Alfa" = home-manager.lib.homeManagerConfiguration {
       pkgs = nixpkgs.legacyPackages.x86_64-linux;
       modules = [ ./home.nix ];
      };
    };
  }
