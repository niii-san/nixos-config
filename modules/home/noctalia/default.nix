{ ... }:
# Desktop shell — noctalia v5 (config.toml schema, see https://docs.noctalia.dev/v5)
{
  programs.noctalia = {
    enable = true;

    settings = {

      shell = {
        font_family = "JetBrainsMono Nerd Font";
        ui_scale = 1.0;
        corner_radius_scale = 0.5;
        avatar_path = "~/.face";
        telemetry_enabled = false;
        clipboard_enabled = true;
        clipboard_auto_paste = "off";

        animation = {
          enabled = true;
          speed = 0.85;
        };

        shadow = {
          direction = "down_right";
        };

        panel = {
          transparency_mode = "glass";
          borders = false;
          launcher_placement = "floating";
          launcher_position = "center";
          session_placement = "floating";
          session_position = "center";
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";
        templates = {
          builtin_ids = [
            "cava"
            "gtk3"
            "gtk4"
            "kcolorscheme"
            "niri"
          ];
        };
      };

      wallpaper = {
        enabled = true;
        directory = "~/Pictures/Wallpapers";
        fill_mode = "crop";
        transition = [
          "fade"
          "disc"
          "stripes"
          "wipe"
          "honeycomb"
        ];
        transition_duration = 1500;
        edge_smoothness = 0.05;
      };

      weather = {
        enabled = true;
        unit = "celsius";
        effects = true;
      };

      location = {
        auto_locate = false;
        address = "Kathmandu, Nepal";
      };

      nightlight = {
        enabled = true;
        force = false;
        temperature_day = 4300;
        temperature_night = 3800;
      };

      notification = {
        enable_daemon = true;
        layer = "overlay";
        background_opacity = 0.85;
      };

      osd = {
        position = "top_right";
        background_opacity = 0.85;
      };

      audio = {
        enable_overdrive = false;
      };

      brightness = {
        enable_ddcutil = false;
      };

      battery = {
        warning_threshold = 40;
      };

      lockscreen = {
        enabled = true;
        blur_intensity = 0.8;
        tint_intensity = 0.4;
      };

      idle = {
        behavior = {
          "screen-off" = {
            enabled = true;
            timeout = 300; # 5 min → dim to 10% brightness
            command = "brightnessctl -s set 10%";
            resume_command = "brightnessctl -r";
          };
          lock = {
            enabled = true;
            timeout = 960; # 16 min → lock
            command = "hyprlock";
          };
          suspend = {
            enabled = true;
            timeout = 1140; # 19 min → suspend
            command = "systemctl suspend";
          };
        };
      };

      control_center = {
        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "caffeine"; }
          { type = "power_profile"; }
          { type = "nightlight"; }
          { type = "wallpaper"; }
        ];
      };

      bar = {
        main = {
          position = "top";
          background_opacity = 0.0;
          margin_ends = 12;
          margin_edge = 0;
          padding = 8;
          widget_spacing = 12;
          shadow = true;
          auto_hide = false;
          reserve_space = true;

          start = [
            "control-center"
            "clock"
            "network"
            "bluetooth"
            "media"
          ];
          center = [ "workspaces" ];
          end = [
            "tray"
            "cpu"
            "ram"
            "net_rx"
            "net_tx"
            "volume"
            "microphone"
            "nightlight"
            "brightness"
            "battery"
            "notifications"
            "session"
          ];
        };
      };

      widget = {
        clock = {
          format = "{:%b %d, %a,   %I:%M:%S %p}";
          tooltip_format = "{:%A %Y-%m-%d %I:%M:%S}";
        };

        media = {
          max_length = 400;
          title_scroll = "always";
        };

        workspaces = {
          display = "name";
          max_label_chars = 10;
          labels_only_when_occupied = true;
        };

        tray = {
          drawer = true;
        };

        cpu = {
          type = "sysmon";
          stat = "cpu_usage";
          display = "text";
        };

        ram = {
          type = "sysmon";
          stat = "ram_pct";
          display = "text";
        };

        net_rx = {
          type = "sysmon";
          stat = "net_rx";
          display = "text";
          network_speed_compact = true;
        };

        net_tx = {
          type = "sysmon";
          stat = "net_tx";
          display = "text";
          network_speed_compact = true;
        };

        microphone = {
          type = "volume";
          device = "input";
        };

        battery = {
          display_mode = "glyph";
          show_label = true;
        };
      };
    };
  };
}
