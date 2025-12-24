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

  gtk = { 
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  qt = {
    enable = true;
    style = {
      name = "adwaita-dark";
    };
  };


}
