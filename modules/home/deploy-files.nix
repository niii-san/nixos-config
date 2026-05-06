{ ... }:
{
  home.file.".local/bin/niri-screenshot.sh" = {
    source = ../scripts/niri-screenshot.sh;
    executable = true;
  };
}
