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

    preload-ng = {
      enable = true;
      settings = {
        cycle = 15;
        memTotal = -5;
        memFree = 70;
        memCached = 10;
        memBuffers = 50; 
        minSize = 1000000; 
        processes = 60;
        sortStrategy = 0;
        autoSave = 1800;
        mapPrefix = "/nix/store/;/run/current-system/;!/";
        exePrefix = "/nix/store/;/run/current-system/;!/";
      };
    };
  };
    
  systemd.services.set-min-free-mem = {
   description = "Set vm.min_free_kbytes dynamically";
   wantedBy = [ "multi-user.target" ];
   after = [ "local-fs.target" ];
   serviceConfig = {
     User = "root";
     RemainAfterExit = true;
   };
   script = ''
     TOTAL_MEM=$(${pkgs.gawk}/bin/awk '/MemTotal/ {printf "%.0f", $2 * 0.01}' /proc/meminfo)
     if [ -z "$TOTAL_MEM" ] || [ "$TOTAL_MEM" -eq 0 ]; then
       echo "Failed to calculate memory size" >&2
       exit 1
     fi
     ${pkgs.sysctl}/bin/sysctl -w vm.min_free_kbytes=$TOTAL_MEM
   '';
  };



}
