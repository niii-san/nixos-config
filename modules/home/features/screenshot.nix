{ pkgs, config, ... }:
let
  scriptsDir = "${config.home.homeDirectory}/.local/bin";
in
{

  home.file = {
    "${scriptsDir}/captureFullscreen.sh" = {
      source = ../../scripts/captureFullscreen.sh;
      executable = true;
    };
    "${scriptsDir}/captureSelectArea.sh" = {
      source = ../../scripts/captureSelectArea.sh;
      executable = true;
    };
  };
}
