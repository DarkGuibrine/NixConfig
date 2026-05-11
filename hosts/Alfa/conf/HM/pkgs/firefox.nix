{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;

    languagePacks = [ "pt-BR" ];

    policies = {
      # Updates & Background Services
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      # Feature Disabling
      DisableBuiltinPDFViewer = false;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = false;
      DisableFirefoxScreenshots = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;

      # Access Restrictions
      BlockAboutConfig = false;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;

      # UI and Behavior
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = false;
      OfferToSaveLogins = false;
    };

    configPath = "${config.xdg.configHome}/mozilla/firefox";

    profiles.default = {

      # Extensions

      search = {
        force = true;
        default = "google";
        privateDefault = "google";

        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };

          "NixOS Wiki" = {
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nw" ];
          };
        };
      };
    };
  };
}
