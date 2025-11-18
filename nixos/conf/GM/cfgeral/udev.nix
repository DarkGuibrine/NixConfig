{ config, lib, inputs, pkgs, ... }: {

  # OpenRGB setup
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    package = pkgs.openrgb-with-all-plugins; # enable all plugins
  };
  services = {
  udev.enable = true;
  udev.extraRules = ''
  KERNEL=="hidraw*", ATTRS{idVendor}=="1d57", ATTRS{idProduct}=="fa60", MODE="0666", SYMLINK+="xenta-mouse-hidraw"
  KERNEL=="hidraw*", ATTRS{idVendor}=="1d57", ATTRS{idProduct}=="fa55", MODE="0666", SYMLINK+="xenta-mouse-hidraw"
  '';
  };
}
