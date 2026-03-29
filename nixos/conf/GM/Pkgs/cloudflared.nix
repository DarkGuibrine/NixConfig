{ config, lib, inputs, pkgs, ... }: {

  services.cloudflared = {
    enable = true;
    tunnels = {
      "d5615be7-62ce-414c-a2b3-67dcbbbd4ac4" = {
        credentialsFile = "/etc/cloudflared/d5615be7-62ce-414c-a2b3-67dcbbbd4ac4.json";
        default = "http_status:404";
        ingress = {
          "pass.darkgui.com.br" = "http://localhost:8080";
        };
      };
    };
  };

}

