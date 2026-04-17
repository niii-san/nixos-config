{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    plugins = with pkgs; [
      rofi-emoji # emoji picker  → rofi -show emoji
      rofi-calc # calculator    → rofi -show calc
    ];

    # Point to the rasi theme file (co-located in this directory)
    theme = ./tokyonight-moon.rasi;

    extraConfig = {
      # ── Modes ───────────────────────────────────────────────
      modi = "drun,run,window,emoji,calc";
      
      # ── Icons ───────────────────────────────────────────────
      show-icons = true;
      icon-theme = "Papirus-Dark";

      # ── Display labels (shown in mode-switcher bar) ──────────
      display-drun = "  Apps";
      display-run = "  Run";
      display-window = "  Windows";
      display-emoji = "󰞅  Emoji";
      display-calc = "  Calc";

      # ── App launcher format ──────────────────────────────────
      drun-display-format = "{name}";

      # ── Behaviour ────────────────────────────────────────────
      kb-cancel = "Escape";
      matching = "fuzzy";
      sort = true;
      sorting-method = "fzf";
      scroll-method = 0;
      disable-history = false;
      hide-scrollbar = false;

      # ── Calculator (rofi-calc) ────────────────────────────────
      calc-command = "echo -n '{result}' | wl-copy";
      calc-result-clipboard = true;
    };
  };

  # ── Launcher scripts (call these from Hyprland keybinds) ─────
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "rofi-launcher" ''
      rofi -show drun -show-icons
    '')
    (pkgs.writeShellScriptBin "rofi-window" ''
      rofi -show window -show-icons
    '')
    (pkgs.writeShellScriptBin "rofi-emoji" ''
      rofi -show emoji
    '')
    (pkgs.writeShellScriptBin "rofi-calc" ''
      rofi -show calc -no-show-match -no-sort
    '')
    (pkgs.writeShellScriptBin "rofi-runner" ''
      rofi -show run
    '')
  ];
}
