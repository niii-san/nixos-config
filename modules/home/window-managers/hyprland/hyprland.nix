{ pkgs, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      layerrule = [
        "blur on, match:namespace rofi"
        "ignore_alpha 0, match:namespace rofi"
        "blur on, match:namespace waypaper"
        "ignore_alpha 0, match:namespace waypaper"
        "blur on, match:namespace waybar"
        "ignore_alpha 0, match:namespace waybar"
      ];

      # ══════════════════════════════════════════════════════════════════
      # ENVIRONMENT
      # ══════════════════════════════════════════════════════════════════
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "QT_QPA_PLATFORM,wayland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # ══════════════════════════════════════════════════════════════════
      # MONITOR & VARIABLES
      # ══════════════════════════════════════════════════════════════════
      monitor = [ ",preferred,auto,1.25" ];

      "$terminal" = "foot";
      "$fileManager" = "thunar";
      "$browser" = "firefox";
      "$mod" = "SUPER";

      # ══════════════════════════════════════════════════════════════════
      # AUTOSTART
      # ══════════════════════════════════════════════════════════════════
      exec-once = [
        "waybar"
        "swaync"
        "nm-applet --indicator"
        "systemctl --user start hyprpolkitagent"
        "awww-daemon"
        "hypridle"
        "hyprlock"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      # ══════════════════════════════════════════════════════════════════
      # GENERAL
      # ══════════════════════════════════════════════════════════════════
      general = {
        gaps_in = 5;
        gaps_out = 12;
        border_size = 2;
        "col.active_border" = "rgba(82aaffff) rgba(c099ffff) 45deg";
        "col.inactive_border" = "rgba(2f334daa)";
        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = false;
      };

      # ══════════════════════════════════════════════════════════════════
      # DECORATION
      # ══════════════════════════════════════════════════════════════════
      decoration = {
        rounding = 12;
        active_opacity = 1.0;
        inactive_opacity = 0.92;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 20;
          render_power = 4;
          color = "rgba(1e203099)";
        };

        blur = {
          enabled = true;
          size = 10;
          passes = 4;
        };
      };

      # ══════════════════════════════════════════════════════════════════
      # ANIMATIONS
      # ══════════════════════════════════════════════════════════════════
      animations = {
        enabled = true;
        bezier = [
          "easeOutExpo,  0.16, 1, 0.3, 1"
          "easeOutBack,  0.34, 1.56, 0.64, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "smoothIn,     0.25, 1, 0.5, 1"
          "md3_decel,    0.05, 0.7, 0.1, 1"
          "md3_accel,    0.3, 0, 0.8, 0.15"
          "menu_decel,   0.1, 1, 0, 1"
          "menu_accel,   0.38, 0.04, 1, 0.07"
          "linear,       0, 0, 1, 1"
        ];
        animation = [
          "windowsIn,        1, 4, easeOutBack,  popin 60%"
          "windowsOut,       1, 3, md3_accel,    popin 60%"
          "windowsMove,      1, 4, easeOutExpo,  slide"
          "border,           1, 8, easeOutExpo"
          "borderangle,      1, 80, linear,      loop"
          "fade,             1, 4, easeOutCubic"
          "fadeIn,           1, 4, easeOutCubic"
          "fadeOut,          1, 3, md3_accel"
          "layersIn,         1, 3, menu_decel,   slide"
          "layersOut,        1, 2, menu_accel,   slide"
          "workspaces,       1, 5, easeOutExpo,  slide"
          "specialWorkspace, 1, 4, md3_decel,    slidevert"
        ];
      };

      # ══════════════════════════════════════════════════════════════════
      # INPUT
      # ══════════════════════════════════════════════════════════════════
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };

      # ══════════════════════════════════════════════════════════════════
      # LAYOUT
      # ══════════════════════════════════════════════════════════════════
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      # ══════════════════════════════════════════════════════════════════
      # MISC
      # ══════════════════════════════════════════════════════════════════
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        animate_manual_resizes = true;
        enable_swallow = true;
        swallow_regex = "^(foot|kitty|alacritty)$";
        focus_on_activate = true;
      };

      xwayland.force_zero_scaling = true;
      cursor.no_hardware_cursors = true;

      # ══════════════════════════════════════════════════════════════════
      # KEYBINDINGS
      # ══════════════════════════════════════════════════════════════════
      bind = [
        # ── Apps ─────────────────────────────────────────────────────
        "$mod, Return,         exec, $terminal"
        "$mod, E,              exec, $terminal"
        "$mod SHIFT, E,        exec, kitty"
        "$mod, B,              exec, $browser"
        "$mod, Q,              exec, $fileManager"

        # ── Window management ─────────────────────────────────────────
        "$mod, C,              killactive"
        "$mod, F,              fullscreen, 0"
        "$mod SHIFT, F,        fullscreen, 1"
        "$mod, T,              togglefloating"
        "$mod SHIFT, T,        workspaceopt, allfloat"
        "$mod, U,              pseudo"
        "$mod SHIFT, J,        togglesplit"
        "$mod SHIFT, S,        swapsplit"
        "$mod, G,              togglegroup"
        "$mod CTRL, Tab,       changegroupactive, f"
        "$mod CTRL SHIFT, Tab, changegroupactive, b"
        "$mod ALT, P,          pin"

        # ── Focus: vim keys ───────────────────────────────────────────
        "$mod, H,              movefocus, l"
        "$mod, J,              movefocus, d"
        "$mod, K,              movefocus, u"
        "$mod, L,              movefocus, r"
        "$mod, left,           movefocus, l"
        "$mod, right,          movefocus, r"
        "$mod, up,             movefocus, u"
        "$mod, down,           movefocus, d"

        # ── Move windows ──────────────────────────────────────────────
        "$mod CTRL, H,         movewindow, l"
        "$mod CTRL, J,         movewindow, d"
        "$mod CTRL, K,         movewindow, u"
        "$mod CTRL, L,         movewindow, r"

        # ── Resize ───────────────────────────────────────────────────
        "$mod SHIFT, right,    resizeactive, 80 0"
        "$mod SHIFT, left,     resizeactive, -80 0"
        "$mod SHIFT, down,     resizeactive, 0 80"
        "$mod SHIFT, up,       resizeactive, 0 -80"

        # ── Workspaces ───────────────────────────────────────────────
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod, bracketright,   workspace, e+1"
        "$mod, bracketleft,    workspace, e-1"
        "$mod, mouse_down,     workspace, e+1"
        "$mod, mouse_up,       workspace, e-1"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod ALT, 1, movetoworkspacesilent, 1"
        "$mod ALT, 2, movetoworkspacesilent, 2"
        "$mod ALT, 3, movetoworkspacesilent, 3"
        "$mod ALT, 4, movetoworkspacesilent, 4"
        "$mod ALT, 5, movetoworkspacesilent, 5"

        "$mod, Z,              togglespecialworkspace, magic"
        "$mod SHIFT, Z,        movetoworkspace, special:magic"

        # ── Launchers ────────────────────────────────────────────────
        "$mod, SPACE,          exec, rofi -show drun"
        "$mod, Tab,            exec, rofi -show window"
        "$mod, period,         exec, rofi-emoji"
        "$mod SHIFT, C,        exec, rofi-calc"
        "$mod, V,              exec, cliphist list | rofi -dmenu -p ' Clipboard' | cliphist decode | wl-copy"

        # ── Toggles ──────────────────────────────────────────────────
        "$mod SHIFT, B,  exec, bash -c 'pgrep -x waybar > /dev/null && killall waybar || waybar &'"
        "$mod, Escape,   exec, bash -c 'pgrep -x rofi > /dev/null && killall rofi || bash ~/.config/waybar/scripts/powermenu.sh'"
        "$mod, W,        exec, bash -c 'pgrep -x waypaper > /dev/null && killall waypaper || waypaper'"
        "$mod SHIFT, W,  exec, bash -c 'pgrep -x awww-daemon > /dev/null && awww kill || awww-daemon &'"

        # ── Media ────────────────────────────────────────────────────
        "$mod, P,              exec, playerctl play-pause"
        "$mod SHIFT, P,        exec, playerctl stop"
        "$mod, comma,          exec, playerctl previous"

        # ── Screenshots (your custom scripts + quick capture) ─────────
        "$mod ALT SHIFT, X,    exec, ~/.local/bin/captureFullscreen.sh"
        "$mod ALT, X,          exec, ~/.local/bin/captureSelectArea.sh"
        ", Print,              exec, grim -g \"$(slurp)\" - | swappy -f -"
        "$mod, Print,          exec, grim - | swappy -f -"

        # ── Session ──────────────────────────────────────────────────
        "$mod SHIFT, M,        exit"
        "$mod CTRL, L,         exec, hyprlock"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ", XF86AudioRaiseVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp,   exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };

    # ── Window rules in raw config (HM module doesn't handle new syntax) ─
    extraConfig = ''
      windowrule = match:class ^(pavucontrol)$, float on
      windowrule = match:class ^(nm-connection-editor)$, float on
      windowrule = match:class ^(Thunar)$, float on
      windowrule = match:class ^(Thunar)$, size 1170 800
      windowrule = match:class ^(Thunar)$, center 1
      windowrule = match:class ^(Thunar)$, opacity 0.95 0.88
      windowrule = match:class ^(waypaper)$, opacity 0.68 0.68
      windowrule = match:class ^(waypaper)$, float on
      windowrule = match:class ^(waypaper)$, size 880 560 
      windowrule = match:class ^(waypaper)$, move 622 83
      windowrule = match:class ^(org.gnome.Calculator)$, float on
      windowrule = match:class ^(imv)$, float on
      windowrule = match:class ^(mpv)$, float on
      windowrule = match:title ^(Picture-in-Picture)$, float on
      windowrule = match:title ^(Open File).*$, float on
      windowrule = match:title ^(Save File).*$, float on
      windowrule = match:class ^(pavucontrol)$, size 800 600
      windowrule = match:class ^(pavucontrol)$, center 1
      windowrule = match:class ^(nm-connection-editor)$, center 1
      windowrule = match:title ^(Picture-in-Picture)$, pin on
      windowrule = match:class ^(foot)$, opacity 0.95 0.88
      windowrule = match:class ^(kitty)$, opacity 0.95 0.88
      windowrule = match:class ^(Code)$, opacity 0.96 0.90
    '';
  };
}
