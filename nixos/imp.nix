{ config, lib, inputs, pkgs, ... }: {

   imports = [
    ./hardware-configuration.nix
    ./conf/Pkgs/pkgs.nix
    ./conf/Alias/alias.nix
    ./conf/CfStorage/CfStorage.nix
    ./conf/PatchJogos/patch.nix
    ./conf/environmentvariables/variables.nix
    ./conf/Flatpak/flatpak.nix
    ./conf/Flakes/flakeconfig.nix
    ./conf/Nvidia/nvidia.nix
    ./conf/NixHelper/nixhelper.nix
    ./conf/Audio/audio.nix
    ./conf/configidioma/configidioma.nix
    ./conf/wireless/wireless.nix
    ./conf/Fish/fish.nix
    ./conf/DistroBox/distrobox.nix
    ./conf/Obs/obs.nix
    #./conf/DE/gnome.nix #gnome
    ./conf/DE/kde.nix #kde
    #./conf/DE/cosmic.nix #cosmic
  ];
}
