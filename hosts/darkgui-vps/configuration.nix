{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  vars = import ./vars.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko
    ./disk-config.nix
    ./config/imp.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    initrd.systemd.enable = true;
  };

  systemd.targets.multi-user.enable = true;

  networking.hostName = vars.hostname;
  networking.networkmanager.enable = true;

  time.timeZone = vars.timezone;
  i18n.defaultLocale = vars.locale;

  users = {
    mutableUsers = false;
    users.${vars.username} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      openssh.authorizedKeys.keys = vars.sshKey;
    };
    users.godot = {
      isNormalUser = true;
      extraGroups = [
        "docker"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHd9zC2Hux0OW57hQ2djiisa2jyTrZOQcS2FLFkQohvI rangelsm2013@gmail.com"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHr63aXlTSmorypxb689ApdqjEmyTKJbLtelYsvQpBdu darkgui@protonmail.com"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIbKfzdNXMkQ0ADyH+Hgx7uqRx3HdJ0Y+PFZ3lmYz8Q0 rangelsm2013@gmail.com"
      ];
    };
  };

  # Enable passwordless sudo.
  security.sudo.extraRules = [
    {
      users = [ vars.username ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  ## Config do fish
  programs.fish.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
         then
           shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
           exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
         fi '';
  };

  services.getty.autologinUser = null;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.11"; # Did you read the comment?
}
