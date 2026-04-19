{
  config,
  lib,
  ...
}:
{
  options.mods.kitty = {
    enable = lib.mkEnableOption "kitty";
  };

  config = lib.mkIf config.mods.kitty.enable {
    programs.kitty = {
      enable = true;
      extraConfig = ''
        include ${config.mods.flakePath}/mods/home/kitty/kitty.conf
      '';
      settings.clear_all_shortcuts = "yes";
    };
  };
}
