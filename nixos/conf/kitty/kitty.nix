{ config, lib, inputs, pkgs, ... }: {

  options.mods.kitty = {
    enable = lib.mkEnableOption "Enable Kitty.";
  };

  config = lib.mkIf config.mods.kitty.enable {
    programs.kitty = {
      enable = true;
      extraConfig = "include ${config.mods.flakePath}/conf/kitty/kitty.conf";
      settings.clear_all_shortcuts = "yes";
    };
  };
}

