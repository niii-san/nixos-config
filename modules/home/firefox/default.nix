{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles = {
      lw = {
        id = 0;
        name = "lw";
        isDefault = true;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
        ];

        settings = {
          "browser.startup.homepage" = "about:newtab";
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "dom.security.https_only_mode" = true;
        };
      };

      nm = {
        id = 1;
        name = "nm";

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
        ];

        settings = {
          "privacy.trackingprotection.enabled" = true;
          "dom.security.https_only_mode" = true;
        };
      };

      pers = {
        id = 2;
        name = "pers";

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
        ];

        settings = {
          "privacy.trackingprotection.enabled" = true;
          "dom.security.https_only_mode" = true;
        };
      };

    };
  };

  # Desktop launchers for each profile
  xdg.desktopEntries = {
    firefox-lw = {
      name = "Firefox — LW";
      genericName = "Web Browser";
      exec = "firefox -P lw --no-remote %u"; # <-- THIS is the fix
      icon = "firefox";
      categories = [
        "Network"
        "WebBrowser"
      ];
      mimeType = [
        "text/html"
        "text/xml"
        "application/xhtml+xml"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
      ];
    };

    firefox-nm = {
      name = "Firefox — NM";
      genericName = "Web Browser";
      exec = "firefox -P nm --no-remote %u"; # <-- same here
      icon = "firefox";
      categories = [
        "Network"
        "WebBrowser"
      ];
    };

    firefox-pers = {
      name = "Firefox — PERS";
      genericName = "Web Browser";
      exec = "firefox -P pers --no-remote %u"; # <-- same here
      icon = "firefox";
      categories = [
        "Network"
        "WebBrowser"
      ];
    };

  };
}
