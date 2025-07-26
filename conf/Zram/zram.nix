{ config, lib, inputs, pkgs, ... }: {

    zramSwap = {
    enable = true;
    memoryPercent = 100;
    algorithm = "lz4";
    };

}
