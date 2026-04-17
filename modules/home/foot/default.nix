{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font:size=13";
        font-bold = "JetBrainsMono Nerd Font:weight=Bold:size=13";
        dpi-aware = "no";
        pad = "12x10";
        shell = "bash";
      };

      scrollback = {
        lines = 10000;
        multiplier = "3.0";
      };

      cursor = {
        style = "beam";
        blink = "yes";
        blink-rate = "500";
        beam-thickness = "1.5";
      };

      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };

      url = {
        launch = "xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
      };

      # Tokyo Night Moon
      colors-dark = {
        alpha = "0.92";
        background = "222436";
        foreground = "c8d3f5";

        # Normal colors
        regular0 = "1b1d2b"; # black
        regular1 = "ff757f"; # red
        regular2 = "c3e88d"; # green
        regular3 = "ffc777"; # yellow
        regular4 = "82aaff"; # blue
        regular5 = "c099ff"; # magenta
        regular6 = "86e1fc"; # cyan
        regular7 = "828bb8"; # white

        # Bright colors
        bright0 = "444a73"; # bright black
        bright1 = "ff757f"; # bright red
        bright2 = "c3e88d"; # bright green
        bright3 = "ffc777"; # bright yellow
        bright4 = "82aaff"; # bright blue
        bright5 = "c099ff"; # bright magenta
        bright6 = "86e1fc"; # bright cyan
        bright7 = "c8d3f5"; # bright white

        # UI highlights
        selection-foreground = "c8d3f5";
        selection-background = "2f334d";
        search-box-no-match = "ff757f 1b1d2b";
        search-box-match = "ffc777 2f334d";
        jump-labels = "ffc777 1b1d2b";
        urls = "86e1fc";
      };

      key-bindings = {
        scrollback-up-page = "Shift+Page_Up";
        scrollback-down-page = "Shift+Page_Down";
        clipboard-copy = "Control+Shift+c XF86Copy";
        clipboard-paste = "Control+Shift+v XF86Paste";
        primary-paste = "Shift+Insert";
        search-start = "Control+Shift+r";
        font-increase = "Control+plus Control+equal Control+KP_Add";
        font-decrease = "Control+minus Control+KP_Subtract";
        font-reset = "Control+0 Control+KP_0";
        spawn-terminal = "Control+Shift+n";
        unicode-input = "Control+Shift+u";
        show-urls-launch = "Control+Shift+o";
      };
    };
  };
}
