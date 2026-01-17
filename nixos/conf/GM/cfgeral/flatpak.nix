{ config, lib, inputs, pkgs, ... }: {
  
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "app/com.dec05eba.gpu_screen_recorder/x86_64/stable"
      
    ];
    update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
  };

}
