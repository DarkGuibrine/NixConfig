{pkgs, config, lib, ...}: {

 programs.git.settings = {
    enable = true;
    user.email = "darkgui@protonmail.com";
    user.name = "DarkGui";
   credential.helper = "store";
  };
}