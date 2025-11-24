{ config, lib, inputs, pkgs, ... }: {

  boot = {
    modprobeConfig.enable = true;
    kernelModules = [ "tcp_bbr" ];
    extraModprobeConfig = 
    "options nvidia NVreg_UsePageAttributeTable=1 \
    NVreg_InitializeSystemMemoryAllocations=0 \
    NVreg_DynamicPowerManagement=0x02";
    kernel.sysctl = {
      "kernel.split_lock_mitigate" = 0;
      "kernel.nmi_watchdog" = 0;
      "net.core.netdev_max_backlog" = 4096;
      "fs.file-max" = 2097152;
      "net.ipv4.tcp_congestion_control" = "bbr";
    };
  };


  services = {
  
  preload.enable = true;
  
  earlyoom = {
    enable = true;
    freeSwapThreshold = 2;
    freeMemThreshold = 2;
    extraArgs = [
      "-g" "--avoid" "'^(X|plasma.*|konsole|kwin|wayland|gnome.*)$'"
      ];
    };

  udev = {
	  enable = true;
	  extraRules = ''
     # Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
     ACTION=="add|bind", SUBSYSTEM=="pci", DRIVERS=="nvidia", \
     ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", \
     TEST=="power/control", ATTR{power/control}="auto"

     # Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
     ACTION=="remove|unbind", SUBSYSTEM=="pci", DRIVERS=="nvidia", \
     ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", \
     TEST=="power/control", ATTR{power/control}="on"
	     '';
     };
  };

}
