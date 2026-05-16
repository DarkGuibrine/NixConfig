{ lib, ... }:
{
  imports = [
    ./netbird/netbird.nix
    ./tailscale/tailscale.nix
  ];

  options.mods = {
    flakePath = lib.mkOption {
      type = lib.types.str;
      default = lib.mkError "Option 'mods.flakePath' must be explicitly set.";
      description = "The absolute path of this flake. Must be explicitly set.";
    };
  };
}
