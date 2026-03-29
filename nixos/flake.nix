{
  description = "A very basic flake";
  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    preload-ng.url = "github:miguel-b-p/preload-ng"; 
    #chaotic.url = "github:lonerOrz/nyx-loner";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    dms.url = "github:AvengeMedia/DankMaterialShell";
    niri.url = "github:sodiboo/niri-flake";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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
    shiru = {
     url = "github:darkguibrine/shiru-nix";
     inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self ,nixpkgs ,nixpkgs-stable ,nixpkgs-master ,home-manager ,zen-browser ,nur ,shiru ,preload-ng ,nix-cachyos-kernel ,aagl ,sops-nix ,dms ,quickshell ,dms-plugin-registry  ,niri ,noctalia , ...} @ inputs: {
    nixosConfigurations = {
      "Alfa" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          nur.modules.nixos.default
          preload-ng.nixosModules.default 
          niri.nixosModules.niri
          sops-nix.nixosModules.sops
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

