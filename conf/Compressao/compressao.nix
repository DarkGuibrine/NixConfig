{ config, lib, inputs, pkgs, ... }: {

  ## compressao brtfs
  fileSystems = {
    "/" = {
      options = [ "compress=zstd" ];
    };
  };

  ## zram
  zramSwap = {
  enable = true;
  memoryPercent = 70;
  algorithm = "zstd";
  };
}
