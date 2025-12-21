{pkgs, config, lib, ...}: {

 imports = [
  ./conf/HM/imp.nix
  {options.mods = {flakePath = lib.mkOption {type = lib.types.str; default = lib.mkError "Option 'mods.flakePath' must be explicitly set."; description = "The absolute path of this flake. Must be explicitly set.";};};}
];

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

     mods = {
  kitty.enable = true;
  flakePath = "/etc/nixos";
  };

  ## config gnome
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

}
