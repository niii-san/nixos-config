{
  pkgs,
  lib,
  ...
}:
{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      #  style = "numbers,changes,headers,rule,grid";
      style = "full";
      # ansi,Catppuccin,base16,base16-256,GitHub,Nord,etc
      theme = lib.mkForce "Dracula";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep
    ];
  };
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
