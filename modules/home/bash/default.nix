{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {

      "ff" = "clear && fastfetch";
      "fm" = "yazi";

    };

    bashrcExtra = ''
      if [[ $- == *i* ]]; then
        fastfetch
      fi
    '';
  };
}
