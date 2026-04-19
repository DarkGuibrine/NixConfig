{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{

  boot.kernelPackages =
    let
      customKernel =
        inputs.nix-cachyos-kernel.legacyPackages.x86_64-linux.linuxPackages-cachyos-latest.kernel.override
          {
            processorOpt = "native";

            lto = "thin";

            scheduler = "bore";

          };
    in
    pkgs.linuxPackagesFor customKernel;

}
