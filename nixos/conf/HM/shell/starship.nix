{ config, lib, inputs, pkgs, ... }: {

  programs.starship = {
  enable = true;
  settings = lib.importTOML "${config.programs.starship.package}/share/starship/presets/nerd-font-symbols.toml";
  enableFishIntegration = true;
  };

}
