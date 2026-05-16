{
  config,
  lib,
  ...
}:
{
  options.mods.netbird = {
    enable = lib.mkEnableOption "netbird";
  };

  config = lib.mkIf config.mods.netbird.enable {
    services.netbird.clients.wt0 = {
        login = {
          enable = false;
          setupKeyFile = "/path/to/your/setup-key";
        };
        port = 51821;
        ui.enable = false;
        openFirewall = true;
        openInternalFirewall = true;
      };
    services.resolved.enable = true;
  };
}
