{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak"; 
    preload-ng.url = "github:miguel-b-p/preload-ng"; 
    chaotic.url = "github:lonerOrz/nyx-loner";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
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
    hayase = {
     url = "github:darkguibrine/hayase-nix";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self ,nixpkgs ,nixpkgs-stable ,nixpkgs-master ,home-manager ,zen-browser ,nur ,aagl ,hayase ,nix-flatpak ,preload-ng ,chaotic ,determinate , ...} @ inputs: {
    nixosConfigurations = {
      "Alfa" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          nur.modules.nixos.default
          nix-flatpak.nixosModules.nix-flatpak
          preload-ng.nixosModules.default 
          chaotic.nixosModules.default
          determinate.nixosModules.default
	        {services.preload-ng.enable = true;}
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
       modules = [ 
        ./home.nix
       ];
      };
    };
  }

