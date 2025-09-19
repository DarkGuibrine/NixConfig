{pkgs, config, ...}: {

 imports = [
  ./conf/Fontes/fontes.nix
  ./conf/Pkgs/pkgshome.nix
  ./conf/kitty/kitty.nix
];

  home.username = "gui";
  home.homeDirectory = "/home/gui";

  programs.home-manager.enable = true;
  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;

  ## config gnome
  #dconf = {
  #  enable = true;
  #  settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  #};


  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.11";
}