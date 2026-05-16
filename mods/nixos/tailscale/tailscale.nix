{
  config,
  lib,
  ...
}:
{
  options.mods.tailscale = {
    enable = lib.mkEnableOption "tailscale";
  };

  config = lib.mkIf config.mods.tailscale.enable {
    services.tailscale = {
      enable = true;
      extraUpFlags = [
         "--exit-node-allow-lan-access=true"
        "--ssh"
        "--accept-dns=true"
      ];
    };
  };
}
