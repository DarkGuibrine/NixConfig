{pkgs, config, lib, ...}: {

 programs.git = {
    enable = true;
    userName = "DarkGui";
    userEmail = "guihermando13@gmail.com";
    extraConfig = {
      credential.helper = "store"; 
    };
  };
}