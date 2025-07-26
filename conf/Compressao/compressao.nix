{ config, lib, inputs, pkgs, ... }: {

  fileSystems = {
    "/" = {
      options = [ "compress=zstd" ];
    };
  };

}
