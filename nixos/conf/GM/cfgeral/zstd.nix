{ config, lib, inputs, pkgs, ... }: {

  ## compressao brtfs
  fileSystems = {
    "/" = {
      options = [ "compress=zstd:3" ];
    };
  };

  ## zram
  zramSwap = {
  enable = true;
  memoryPercent = 40;
  algorithm = "zstd";
  };

}
