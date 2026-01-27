{config, pkgs, ...}: {

  ## starship
  programs.starship = {
  enable = true;
  settings = lib.importTOML "${config.programs.starship.package}/share/starship/presets/nerd-font-symbols.toml";
  enableFishIntegration = true;
  };

  ## Configuraçao Git
  programs.git.settings = {
    enable = true;
    user.email = "darkgui@protonmail.com";
    user.name = "DarkGui";
   credential.helper = "store";
  };

  ## Pacotes extras
  fonts.fontconfig.enable = true; 
  home.packages = with pkgs; [

    ## Fish
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc

    ## Fontes
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.overpass
    noto-fonts
    liberation_ttf
    dejavu_fonts
  ];
}