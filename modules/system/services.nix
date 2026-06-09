{ pkgs, config, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.upower.enable = true;
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        UserspaceHID = "true";
      };

      LE = {
        MinConnectionInterval = 7; # 7 * 1.25ms = 8.75ms
        MaxConnectionInterval = 9; # 9 * 1.25ms = 11.25ms
        ConnectionLatency = 0;
        SupervisionTimeout = 100;
      };
    };

  };

  services.blueman.enable = true;

  hardware.enableAllFirmware = true;

  services.power-profiles-daemon.enable = true;

  programs.niri.enable = true;
  niri-flake.cache.enable = false;
  programs.thunar.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.openssh.enable = true;

  services.getty.autologinUser = "nishansys";

  security.polkit.enable = true;

  services.mongodb = {
    enable = true;
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_17;

    settings = {
      timezone = "Asia/Kathmandu";
      log_timezone = "Asia/Kathmandu";
    };

    authentication = pkgs.lib.mkOverride 10 ''
      # TYPE  DATABASE  USER  ADDRESS     METHOD
      local   all       all               peer
      host    all       all   127.0.0.1/32  scram-sha-256
      host    all       all   ::1/128       scram-sha-256
    '';

    ensureDatabases = [
      "mydb"
      "nishansys"
    ];
    ensureUsers = [
      {
        name = "nishansys";
        ensureDBOwnership = true;
      }
    ];
  };

}
