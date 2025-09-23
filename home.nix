{pkgs, config, lib, ...}: {

 imports = [
  ./conf/Fontes/fontes.nix
  ./conf/Pkgs/pkgshome.nix
  ./conf/kitty/kitty.nix
  ./conf/git/git.nix
  {options.mods = {flakePath = lib.mkOption {type = lib.types.str; default = lib.mkError "Option 'mods.flakePath' must be explicitly set."; description = "The absolute path of this flake. Must be explicitly set.";};};}
];

  mods = {
  kitty.enable = true;
  flakePath = "/etc/nixos";
  };

  home = {
    username = "gui";
    homeDirectory = "/home/gui";
    stateVersion = "25.11";
  };

  programs = {
    home-manager.enable = true;
    fish.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  ## config gnome
  #dconf = {
  #  enable = true;
  #  settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  #};
}