{ pkgs, ... }:

let
  mediaScript = pkgs.writeShellScript "waybar-media" ''
    status=$(playerctl status 2>/dev/null)
    if [ "$status" = "Playing" ]; then
      track=$(playerctl metadata --format "{{artist}} — {{title}}" 2>/dev/null)
      if [ ''${#track} -gt 40 ]; then track="''${track:0:40}…"; fi
      echo "  $track"
    elif [ "$status" = "Paused" ]; then
      track=$(playerctl metadata --format "{{artist}} — {{title}}" 2>/dev/null)
      if [ ''${#track} -gt 40 ]; then track="''${track:0:40}…"; fi
      echo "  $track"
    else
      echo ""
    fi
  '';

in
{

  # ── Deploy scripts ────────────────────────────────────────────────────
  home.file.".config/waybar/scripts/powermenu.sh" = {
    source = ./scripts/powermenu.sh;
    executable = true;
  };
  home.file.".config/waybar/scripts/powermenu.rasi" = {
    source = ./scripts/powermenu.rasi;
  };

  home.file.".config/waybar/scripts/wttr.py" = {
    source = ./scripts/wttr.py;
    executable = true;
  };

  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 35;
      spacing = 0;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;

      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [
        "clock"
        "custom/weather"
      ];
      modules-right = [
        "custom/media"
        "network"
        "cpu"
        "memory"
        "pulseaudio"
        "backlight"
        "battery"
        "custom/notification"
        "tray"
        "custom/power"
      ];

      backlight = {
        device = "nvidia_wmi_ec_backlight";
        format = "{icon} {percent}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
        on-scroll-up = "brightnessctl set +5%";
        on-scroll-down = "brightnessctl set 5%-";
        tooltip = false;
      };
      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = false;
        format = "{name}";
        on-click = "activate";
      };

      "hyprland/window" = {
        format = "  {}";
        max-length = 40;
        separate-outputs = true;
        rewrite = {
          "(.*) — Brave" = "  $1";
          "(.*) — Firefox" = "  $1";
          "(.*)fish" = "  terminal";
          "(.*) - nvim" = "  $1";
        };
      };

      clock = {
        format = "  {:%I:%M %p %d %b}";
        format-alt = "  {:%a %d %B %Y}";
        tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
      };

      "custom/weather" = {
        format = "{}";
        tooltip = true;
        interval = 1800;
        exec = "$HOME/.config/waybar/scripts/wttr.py";
        return-type = "json";
      };

      "custom/media" = {
        format = "{}";
        interval = 3;
        exec = "${mediaScript}";
        on-click = "playerctl play-pause";
        on-scroll-up = "playerctl next";
        on-scroll-down = "playerctl previous";
        max-length = 30;
      };

      network = {
        format-wifi = "  {essid}";
        format-ethernet = "  {ifname}";
        format-disconnected = "  Offline";
        tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ipaddr}";
        on-click = "nm-connection-editor";
      };

      cpu = {
        interval = 3;
        format = "  {usage}%";
        tooltip = false;
      };

      memory = {
        interval = 3;
        format = "  {used:0.1f}G";
        tooltip-format = "{used:0.1f} / {total:0.1f} GiB";
      };

      pulseaudio = {
        reverse-scrolling = 1;
        format = "  {volume}%";
        format-muted = "  muted";
        on-click = "pavucontrol";
        tooltip = false;
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "  {capacity}%";
        format-charging = "  {capacity}%";
        format-plugged = "  {capacity}%";
        tooltip-format = "{timeTo} • {power:.1f}W";
      };

      "custom/notification" = {
        tooltip = false;
        format = "{icon}";
        format-icons = {
          notification = "";
          none = "";
          dnd-notification = "";
          dnd-none = "";
          inhibited-notification = "";
          inhibited-none = "";
          dnd-inhibited-notification = "";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };

      tray = {
        icon-size = 14;
        spacing = 6;
      };

      "custom/power" = {
        format = "";
        on-click = "bash $HOME/.config/waybar/scripts/powermenu.sh";
        tooltip = false;
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: "JetBrainsMonoNL Nerd Font", "JetBrainsMonoNL NF", monospace;
          font-size: 13px;
          font-weight: bold;
          min-height: 0;
      }

      window#waybar {
          background-color: rgba(30, 32, 48, 0.65);
          border-bottom: 1px solid rgba(130, 170, 255, 0.15);
          color: #c8d3f5;
      }

      tooltip {
          background: rgba(34, 36, 54, 0.95);
          border: 1px solid rgba(47, 51, 77, 0.8);
          border-radius: 8px;
          color: #c8d3f5;
          font-weight: normal;
      }

      /* ── Workspaces ─────────────────────────────────────── */
      #workspaces {
          padding: 0 6px;
      }
      #workspaces button {
          background: transparent;
          color: #c8d3f5;
          padding: 2px 10px;
          margin: 5px 2px;
          border-radius: 6px;
          font-size: 12px;
      }
      #workspaces button:hover {
          background: rgba(47, 51, 77, 0.6);
          color: #c8d3f5;
      }
      #workspaces button.active {
          background: rgba(45, 63, 118, 1);
          color: #82aaff;
      }
      #workspaces button.occupied {
          color: #c8d3f5;
          background: rgba(47, 51, 77, 0.7);
      }
      #workspaces button.urgent {
          background: rgba(255, 117, 127, 0.3);
          color: #ff757f;
      }

      /* ── Window title ───────────────────────────────────── */
      #window {
          color: #c8d3f5;
          padding: 0 10px;
          font-weight: normal;
          font-size: 12px;
      }

      /* ── Module base ────────────────────────────────────── */
      #clock,
      #custom-weather,
      #custom-media,
      #network,
      #cpu,
      #memory,
      #pulseaudio,
      #backlight,
      #battery,
      #custom-notification,
      #tray,
      #custom-power {
          padding: 0 12px;
      }

      #clock              { color: #c099ff; }
      #custom-weather     { color: #86e1fc; border-left: 1px solid rgba(47,51,77,0.6); }

      #custom-media {
      color: #c3e88d;
      font-weight: normal;
      font-size: 12px;
      border-left: 1px solid rgba(47,51,77,0.6);  /* ← was border-right */
      }

      #backlight { color: #ffc777; }


      #network            { color: #c3e88d; border-left: 1px solid rgba(47,51,77,0.6); }
      #network.disconnected { color: #ff757f; }
      #cpu                { color: #ff757f; }
      #memory             { color: #ffc777; }
      #pulseaudio         { color: #82aaff; }
      #pulseaudio.muted   { color: rgba(99,109,166,0.6); }
      #battery            { color: #c3e88d; }
      #battery.charging,
      #battery.plugged    { color: #c3e88d; }
      #battery.warning:not(.charging)  { color: #ffc777; }
      #battery.critical:not(.charging) {
          color: #ff757f;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
      #custom-notification {
          color: #c099ff;
          border-left: 1px solid rgba(47,51,77,0.6);
          font-size: 15px;
      }
      #tray {
          border-left: 1px solid rgba(47,51,77,0.6);
      }

      /* ── Power button ───────────────────────────────────── */
      #custom-power {
          background-color: rgba(255, 117, 127, 0.15);
          color: #ff757f;
          font-size: 15px;
          padding: 0 16px;
          margin: 5px 6px 5px 2px;
          border-radius: 8px;
          border-left: 1px solid rgba(255,117,127,0.3);
          /* vertical centering */
          min-height: 26px;
      }
      #custom-power:hover {
          background-color: rgba(255, 117, 127, 0.3);
      }

      @keyframes blink {
          to { opacity: 0.4; }
      }
    '';
  };

  services.swaync.enable = true;
}
