{ config, lib, inputs, pkgs, ... }: {

  programs.xfconf.enable = true;

  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
    thunar-archive-plugin 
    thunar-vcs-plugin
    thunar-volman
   ];
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };

}
  