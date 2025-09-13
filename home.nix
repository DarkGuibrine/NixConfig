{pkgs, config, ...}: {

 imports = [
  ./conf/Fontes/fontes.nix
  ./conf/Pkgs/pkgshome.nix
];

  home.username = "gui";
  home.homeDirectory = "/home/gui";

  programs.home-manager.enable = true;
  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.11";
}