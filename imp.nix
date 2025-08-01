{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./hardware-configuration.nix
    ./conf/Pkgs/pkgs.nix
    ./conf/Zram/zram.nix
    ./conf/Alias/alias.nix
    ./conf/Compressao/compressao.nix
    ./conf/PatchJogos/patch.nix
    ./conf/Kde/kde.nix
    ./conf/environmentvariables/variables.nix
    ./conf/Flatpak/flatpak.nix
    ./conf/Flakes/flakeconfig.nix
    ./conf/Nvidia/nvidia.nix
    ./conf/NixHelper/nixhelper.nix
    ./conf/Audio/audio.nix
    ./conf/configidioma/configidioma.nix
    ./conf/wireless/wireless.nix
    ./conf/Fish/fish.nix
  ];

}
