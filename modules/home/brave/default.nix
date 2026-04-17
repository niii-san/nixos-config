{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.userSettings.brave;
in
{
  options = {
    userSettings.brave = {
      enable = lib.mkEnableOption "Enable brave browser";
    };
    userSettings.browser = lib.mkOption {
      type = lib.types.str;
      default = "brave";
      description = "Default browser";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.brave ];

    xdg.configFile."BraveSoftware/Brave-Browser/policies/managed/extensions.json".text =
      builtins.toJSON
        {
          ExtensionInstallForcelist = [
            "cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx" # ublock
            "oboonakemofpalcgghocfoadofidjkkk;https://clients2.google.com/service/update2/crx" # keepassxc
            "kgcjekpmcjjogibpjebkhaanilehneje;https://clients2.google.com/service/update2/crx" # karakeep
            "abbpaepbpakcpipajigmlpnhlnbennna;https://clients2.google.com/service/update2/crx" # yt music
            "gebbhagfogifgggkldgodflihgfeippi;https://clients2.google.com/service/update2/crx" # yt dislikes
            "fmkadmapgofadopljbjfkapdkoienihi;https://clients2.google.com/service/update2/crx" # react devtools
          ];
          CommandLineFlagSecurityWarningsEnabled = false;
        };

    xdg.mimeApps.defaultApplications = lib.mkIf (config.userSettings.browser == "brave") {
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";
    };
  };
}
