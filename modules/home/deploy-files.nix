{ ... }:
{
  home.file.".local/bin/screenshot.sh" = {
    source = ../scripts/niri-screenshot.sh;
    executable = true;
  };
}
