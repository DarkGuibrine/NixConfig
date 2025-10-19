{ config, lib, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [lact];
  systemd.services.lact = {
    description = "GPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };
}