{ ... }:
#  ███╗   ██╗ ██████╗  ██████╗████████╗ █████╗ ██╗     ██╗ █████╗
#  ████╗  ██║██╔═══██╗██╔════╝╚══██╔══╝██╔══██╗██║     ██║██╔══██╗
#  ██╔██╗ ██║██║   ██║██║        ██║   ███████║██║     ██║███████║
#  ██║╚██╗██║██║   ██║██║        ██║   ██╔══██║██║     ██║██╔══██║
#  ██║ ╚████║╚██████╔╝╚██████╗   ██║   ██║  ██║███████╗██║██║  ██║
#  ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝
#            noctalia v5 · glass rice · wallpaper-driven colors
#            https://docs.noctalia.dev/v5
{
  programs.noctalia = {
    enable = true;

    settings = {

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ SHELL — glass, shadows, silky animations              ║
      # ╚══════════════════════════════════════════════════════════╝
      shell = {
        font_family = "JetBrainsMono Nerd Font";
        ui_scale = 1.0;
        corner_radius_scale = 1.2;
        avatar_path = "~/.face";
        telemetry_enabled = false;
        clipboard_enabled = true;
        clipboard_auto_paste = "off";
        time_format = "{:%I:%M %p}";
        date_format = "%A, %d %B";

        animation = {
          enabled = true;
          speed = 1.0;
        };

        shadow = {
          direction = "down";
          alpha = 0.65;
        };

        # frosted-glass panels, floating off the bar
        panel = {
          transparency_mode = "glass";
          borders = true;
          shadow = true;
          launcher_placement = "floating";
          launcher_position = "center";
          clipboard_placement = "floating";
          clipboard_position = "center";
          control_center_placement = "floating";
          session_placement = "floating";
          session_position = "center";
          floating_offset = 10;
          open_near_click_control_center = true;
        };

        launcher = {
          app_grid = true;
          categories = true;
          show_icons = true;
          sort_by_usage = true;
          session_search = true;
        };

        # rounded screen corners, faux-CRT style
        screen_corners = {
          enabled = true;
          size = 24;
        };

        screenshot = {
          save_to_file = true;
          copy_to_clipboard = true;
          freeze_screen = true;
          directory = "~/Pictures/Screenshots";
        };
      };

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ THEME — colors ripped live from the wallpaper         ║
      # ╚══════════════════════════════════════════════════════════╝
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
            "qt"
            "niri"
            "foot"
            "btop"
            "starship"
          ];
        };
      };

      # blurred + tinted wallpaper behind windows / niri overview
      backdrop = {
        enabled = true;
        blur_intensity = 0.6;
        tint_intensity = 0.35;
      };

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ WALLPAPER — animated transitions                      ║
      # ╚══════════════════════════════════════════════════════════╝
      wallpaper = {
        enabled = true;
        directory = "~/Pictures/Wallpapers";
        fill_mode = "crop";
        transition = [
          "fade"
          "disc"
          "stripes"
          "wipe"
          "zoom"
          "honeycomb"
        ];
        transition_duration = 1500;
        edge_smoothness = 0.3;
        transition_on_startup = true;
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

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ NOTIFICATIONS + OSD — frosted toasts, side sliders    ║
      # ╚══════════════════════════════════════════════════════════╝
      notification = {
        enable_daemon = true;
        layer = "overlay";
        background_opacity = 0.9;
        offset_x = 16;
        offset_y = 12;
      };

      osd = {
        orientation = "vertical";
        position_vertical = "center_right";
        position = "top_right";
        background_opacity = 0.9;
        offset_x = 16;
        offset_y = 12;
      };

      audio = {
        enable_overdrive = false;
      };

      brightness = {
        enable_ddcutil = false;
      };

      # built-in low-battery warning fires at this percentage
      battery = {
        warning_threshold = 40;
      };

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ LOCK SCREEN — blurred live desktop snapshot           ║
      # ╚══════════════════════════════════════════════════════════╝
      lockscreen = {
        enabled = true;
        blurred_desktop = true;
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

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ HOT CORNERS — flick the mouse, run the shell          ║
      # ╚══════════════════════════════════════════════════════════╝
      hot_corners = {
        enabled = true;
        top_left = {
          action = "overview";
        };
        top_right = {
          action = "control_center";
        };
        bottom_left = {
          action = "launcher";
        };
        bottom_right = {
          action = "window_switcher";
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

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ DOCK — macOS-style, magnifying, auto-hiding           ║
      # ╚══════════════════════════════════════════════════════════╝
      dock = {
        enabled = true;
        position = "bottom";
        auto_hide = true;
        reserve_space = false;
        icon_size = 44;
        background_opacity = 0.78;
        radius = 20;
        margin_edge = 8;
        item_spacing = 6;
        shadow = true;
        show_running = true;
        magnification = true;
        magnification_scale = 1.5;
        active_scale = 1.0;
        inactive_scale = 0.88;
        inactive_opacity = 0.8;
        show_dots = true;
        launcher_position = "start";
        launcher_icon = "grid-dots";
      };

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ BAR — floating islands over a transparent strip       ║
      # ║                                                          ║
      # ║  ╭──────────╮ ╭────────╮  ╭───────────╮  ╭────╮ ╭──────╮ ║
      # ║  │ ⏻ ○●○○  │ │ window │  │ 12:00  ☀ │  │▁▃▅▇│ │ ⚙ 🔋 │ ║
      # ║  ╰──────────╯ ╰────────╯  ╰───────────╯  ╰────╯ ╰──────╯ ║
      # ╚══════════════════════════════════════════════════════════╝
      bar = {
        main = {
          position = "top";
          thickness = 40;
          background_opacity = 0.0;
          margin_edge = 8;
          margin_ends = 14;
          padding = 6;
          widget_spacing = 8;
          radius = 20;
          shadow = true;
          auto_hide = false;
          reserve_space = true;
          font_weight = 600;

          # every widget rides in a translucent capsule by default
          capsule = true;
          capsule_fill = "surface_variant";
          capsule_opacity = 0.82;

          # capsule islands
          capsule_group = [
            {
              id = "nav";
              members = [
                "control-center"
                "workspaces"
              ];
              opacity = 0.82;
            }
            {
              id = "now-playing";
              members = [
                "media"
                "visualizer"
              ];
              opacity = 0.82;
            }
            {
              id = "datetime";
              members = [
                "clock"
                "weather"
              ];
              opacity = 0.82;
            }
            {
              id = "stats";
              members = [
                "cpu"
                "ram"
                "net_rx"
                "net_tx"
              ];
              opacity = 0.82;
            }
            {
              id = "connectivity";
              members = [
                "network"
                "bluetooth"
              ];
              opacity = 0.82;
            }
            {
              id = "levels";
              members = [
                "volume"
                "microphone"
                "brightness"
              ];
              opacity = 0.82;
            }
            {
              id = "system";
              members = [
                "tray"
                "screenshot"
                "clipboard"
                "notifications"
              ];
              opacity = 0.82;
            }
            {
              id = "power";
              members = [
                "battery"
                "caffeine"
                "session"
              ];
              opacity = 0.82;
            }
          ];

          start = [
            "control-center"
            "workspaces"
            "active_window"
            "media"
            "visualizer"
          ];
          center = [
            "clock"
            "weather"
          ];
          end = [
            "cpu"
            "ram"
            "net_rx"
            "net_tx"
            "network"
            "bluetooth"
            "volume"
            "microphone"
            "brightness"
            "tray"
            "screenshot"
            "clipboard"
            "notifications"
            "battery"
            "caffeine"
            "session"
          ];
        };
      };

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ WIDGETS — per-widget tuning                           ║
      # ╚══════════════════════════════════════════════════════════╝
      widget = {
        clock = {
          format = "󰃭 {:%a %d %b}   {:%I:%M %p}";
          tooltip_format = "{:%A, %d %B %Y — %I:%M:%S %p}";
          color = "primary";
        };

        weather = {
          show_condition = true;
          show_temperature = true;
        };

        active_window = {
          display = "icon_and_text";
          max_length = 320;
          title_scroll = "on_hover";
        };

        media = {
          max_length = 340;
          art_size = 18;
          title_scroll = "always";
        };

        visualizer = {
          type = "audio_visualizer";
          width = 52;
          bands = 14;
          mirrored = true;
          centered = true;
          color_1 = "primary";
          color_2 = "tertiary";
        };

        workspaces = {
          display = "name";
          max_label_chars = 10;
          labels_only_when_occupied = true;
          focused_color = "primary";
          occupied_color = "tertiary";
          empty_color = "outline";
          pill_scale = 1.0;
          active_pill_size = 2.4;
        };

        tray = {
          drawer = true;
        };

        cpu = {
          type = "sysmon";
          stat = "cpu_usage";
          display = "gauge";
          highlight_color = "error";
        };

        ram = {
          type = "sysmon";
          stat = "ram_pct";
          display = "gauge";
          highlight_color = "error";
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
          mute_color = "error";
        };

        battery = {
          display_mode = "graphic";
          show_label = true;
          warning_color = "error";
        };

        notifications = {
          hide_when_no_unread = false;
        };

        session = {
          icon_color = "error";
        };
      };

      # ╔══════════════════════════════════════════════════════════╗
      # ║  ✦ DESKTOP WIDGETS — art on the wallpaper layer          ║
      # ║       big clock ✚ weather card ✚ audio rings             ║
      # ╚══════════════════════════════════════════════════════════╝
      desktop_widgets = {
        enabled = true;
        widget_order = [
          "clock_hero"
          "weather_card"
          "viz_floor"
        ];

        widget = {
          clock_hero = {
            type = "clock";
            output = "eDP-1";
            cx = 1660.0;
            cy = 190.0;
            box_width = 420.0;
            box_height = 170.0;
            rotation = 0.0;
            settings = {
              clock_style = "digital";
              format = "{:%I:%M}";
              background_opacity = 0.0;
            };
          };

          weather_card = {
            type = "weather";
            output = "eDP-1";
            cx = 1660.0;
            cy = 400.0;
            rotation = 0.0;
            settings = {
              show_forecast = true;
              forecast_days = 3;
            };
          };

          viz_floor = {
            type = "fancy_audio_visualizer";
            output = "eDP-1";
            cx = 1024.0;
            cy = 1140.0;
            box_width = 880.0;
            box_height = 200.0;
            rotation = 0.0;
            settings = {
              visualization_mode = "bars";
              bar_width = 0.6;
              sensitivity = 1.5;
              fade_when_idle = true;
              primary_color = "primary";
              secondary_color = "tertiary";
            };
          };
        };
      };
    };
  };
}
