{
  description = "A very basic flake";
  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    preload-ng.url = "github:miguel-b-p/preload-ng"; 
    #chaotic.url = "github:lonerOrz/nyx-loner";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    dms.url = "github:AvengeMedia/DankMaterialShell";
    quickshell.url = "git+https://git.outfoxxed.me/quickshell/quickshell";
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
  outputs = {self ,nixpkgs ,nixpkgs-stable ,nixpkgs-master ,home-manager ,zen-browser ,nur ,hayase ,preload-ng ,nix-cachyos-kernel ,aagl ,dms ,dms-plugin-registry ,quickshell , ...} @ inputs: {
    nixosConfigurations = {
      "Alfa" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          nur.modules.nixos.default
          preload-ng.nixosModules.default 
	        {services.preload-ng.enable = true;}
          #chaotic.nixosModules.default
          {imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig;
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

