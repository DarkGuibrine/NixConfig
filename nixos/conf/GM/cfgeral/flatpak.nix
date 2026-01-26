{ config, lib, inputs, pkgs, ... }: {
  
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
    update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
  };

}
