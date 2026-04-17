{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.tmux = {
    enable = true;

    # ── Core settings ──────────────────────────────────────────────────────────
    shell = "${pkgs.bash}/bin/bash";
    terminal = "tmux-256color";
    historyLimit = 10000;
    mouse = true;
    baseIndex = 1; # windows start at 1
    escapeTime = 0; # no ESC delay (important for neovim)
    keyMode = "vi";
    prefix = "C-Space";

    # ── Plugins (replaces TPM entirely) ────────────────────────────────────────
    plugins = with pkgs.tmuxPlugins; [
      sensible # sane defaults everyone forgets to set
      vim-tmux-navigator # <C-h/j/k/l> across panes AND nvim splits
      yank # system-clipboard yank in copy-mode
      resurrect # save/restore sessions across reboots
      continuum # auto-save resurrect every 10 min
      prefix-highlight # status bar lights up when prefix is active
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_show_datetime 1
          set -g @tokyo-night-tmux_date_format MDA
          set -g @tokyo-night-tmux_time_format 12H
          set -g @tokyo-night-tmux_show_music 0
          set -g @tokyo-night-tmux_show_netspeed 0
          set -g @tokyo-night-tmux_show_path 1
          set -g @tokyo-night-tmux_path_format relative
          set -g @tokyo-night-tmux_window_id_style dsquare
          set -g @tokyo-night-tmux_pane_id_style hsquare
          set -g @tokyo-night-tmux_zoom_id_style dsquare
        '';
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'   # restore nvim sessions too
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];

    extraConfig = ''
      # ── True colour ────────────────────────────────────────────────────────
      set-option -sa terminal-overrides ",xterm*:Tc"
      set-option -sa terminal-overrides ",alacritty:RGB"

      # ── General ────────────────────────────────────────────────────────────
      set-option -g renumber-windows on
      set-option -g status-interval 10
      set-option -g automatic-rename on
      set-option -g automatic-rename-format '#(basename "#{pane_current_path}")'
      set-option -g display-time 2000        # message display duration (ms)
      set-option -g focus-events on          # pass focus events to apps (nvim)
      set-option -g detach-on-destroy off    # switch to next session instead of detaching
      set-window-option -g pane-base-index 1

      # ── Prefix ─────────────────────────────────────────────────────────────
      unbind C-b
      bind C-Space send-prefix

      # ── Reload config ──────────────────────────────────────────────────────
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"

      # ── Window navigation ──────────────────────────────────────────────────
      bind -n M-H previous-window
      bind -n M-L next-window
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5

      # ── Pane splitting (open in current dir) ───────────────────────────────
      unbind '"'
      unbind %
      bind _ split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"   # new windows also in cwd

      # ── Pane resizing (repeatable) ─────────────────────────────────────────
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # ── Pane zoom toggle ───────────────────────────────────────────────────
      bind m resize-pane -Z

      # ── Copy-mode vi bindings ──────────────────────────────────────────────
      bind-key -T copy-mode-vi v   send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y   send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi H   send-keys -X start-of-line
      bind-key -T copy-mode-vi L   send-keys -X end-of-line

      # ── Session management ─────────────────────────────────────────────────
      bind s choose-tree -sZ          # session switcher with preview
      bind S new-session              # create new session
      bind X kill-session             # kill current session (not just window)

      # ── Smart pane switching (works with vim-tmux-navigator) ───────────────
      # C-h/j/k/l navigate panes; if nvim is open it passes through to nvim
      # (vim-tmux-navigator plugin handles this automatically)

      # ── Prefix-highlight colours ───────────────────────────────────────────
      set -g @prefix_highlight_fg 'black'
      set -g @prefix_highlight_bg 'blue'
      set -g @prefix_highlight_show_copy_mode 'on'
      set -g @prefix_highlight_copy_mode_attr 'fg=black,bg=yellow'
    '';
  };
}
