{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting ""

      zoxide init fish | source
      atuin init fish --disable-up-arrow | source
      starship init fish | source

      fastfetch
    '';

    shellAliases = {
      ls = "eza --icons";
      ll = "eza -la --icons --git";
      lt = "eza --tree --icons";
      cat = "bat";
      v = "nvim";
      lg = "lazygit";

      ff = "clear && fastfetch";
      fm = "yazi";
      cdlw = "cd /run/media/nishansys/lw";

      vm = "GDK_SCALE=1 GDK_DPI_SCALE=1 GDK_BACKEND=x11 virt-manager";

    };

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];
  };
}
