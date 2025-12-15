{ config, lib, inputs, pkgs, ... }: {

  #boot.kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride {
    #mArch = "GENERIC_V3";
    #useO3 = true;
    #withLTO = "full";
   #};
}
