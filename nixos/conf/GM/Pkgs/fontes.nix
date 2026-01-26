{ config, lib, inputs, pkgs, ... }: {

  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
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
