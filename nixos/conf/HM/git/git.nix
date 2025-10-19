{pkgs, config, lib, ...}: {

 programs.git.settings = {
    enable = true;
    user.email = "guihermando13@gmail.com";
    user.name = "DarkGui";
   credential.helper = "store";
  };
}