{ ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {

      palette = "tokyonight_moon";

      palettes.tokyonight_moon = {
        bg = "#222436";
        surface0 = "#2f334d";
        surface1 = "#444a73";
        surface2 = "#636da6";
        text = "#c8d3f5";
        subtext = "#828bb8";
        red = "#ff757f";
        green = "#c3e88d";
        yellow = "#ffc777";
        blue = "#82aaff";
        magenta = "#c099ff";
        cyan = "#86e1fc";
        teal = "#4fd6be";
        orange = "#ff966c";
        mantle = "#1b1d2b";
        purple = "#c099ff";
        peach = "#ff966c";
      };

      # ── Format: all segments explicitly listed ────────────────────
      # nix_shell, nodejs, python, rust, golang now actually appear!
      format = "[](fg:surface0)$os$username[](fg:surface0 bg:cyan)[](fg:cyan bg:blue)$directory[](fg:blue bg:purple)$git_branch$git_status[](fg:purple bg:surface1)$nix_shell$nodejs$python$rust$golang$cmd_duration[](fg:surface1 bg:surface0)$time[](fg:surface0)$line_break$character";

      os = {
        disabled = false;
        style = "bg:surface0 fg:cyan";
        symbols = {
          NixOS = "󱄅 ";
          Windows = "󰍲 ";
          Ubuntu = "󰕈 ";
          Arch = "󰣇 ";
          Debian = "󰣚 ";
          Fedora = "󰣛 ";
          Macos = " ";
          Linux = "󰌽 ";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:surface0 fg:text";
        style_root = "bg:surface0 fg:red";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:mantle bg:blue";
        format = "[ 󰉋 $path ]($style)";
        truncation_length = 4;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "development" = "󰲋 ";
          "nixdots" = "󱄅 ";
          "Projects" = "󰲋 ";
        };
      };

      git_branch = {
        symbol = " ";
        style = "bg:purple fg:mantle";
        format = "[ $symbol$branch ]($style)";
        truncation_length = 20;
        truncation_symbol = "…";
      };

      git_status = {
        style = "bg:purple fg:mantle";
        format = "[$all_status$ahead_behind ]($style)";
        conflicted = "⚡";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        up_to_date = "✓";
        untracked = "?\${count}";
        stashed = " ";
        modified = "!\${count}";
        staged = "+\${count}";
        renamed = "»\${count}";
        deleted = "✘\${count}";
      };

      # ── Nix shell indicator — now in format so it actually shows ──
      nix_shell = {
        symbol = "󱄅 ";
        style = "bg:surface1 fg:cyan"; # cyan stands out clearly
        format = "[ $symbol$state ]($style)";
        impure_msg = "impure";
        pure_msg = "pure";
      };

      # ── Language segments — bg:surface1 to match their section ───
      nodejs = {
        symbol = " ";
        style = "bg:surface1 fg:green";
        format = "[ $symbol$version ]($style)";
        detect_files = [
          "package.json"
          ".nvmrc"
        ];
      };

      python = {
        symbol = " ";
        style = "bg:surface1 fg:yellow";
        format = "[ $symbol$pyenv_prefix($version)(\($virtualenv\)) ]($style)";
        detect_files = [
          "requirements.txt"
          "pyproject.toml"
          ".python-version"
          "Pipfile"
        ];
      };

      rust = {
        symbol = " ";
        style = "bg:surface1 fg:red";
        format = "[ $symbol$version ]($style)";
        detect_files = [ "Cargo.toml" ];
      };

      golang = {
        symbol = " ";
        style = "bg:surface1 fg:cyan";
        format = "[ $symbol$version ]($style)";
        detect_files = [ "go.mod" ];
      };

      cmd_duration = {
        style = "bg:surface1 fg:yellow";
        format = "[  $duration ]($style)";
        min_time = 2000;
        show_milliseconds = false;
      };

      time = {
        disabled = false;
        time_format = "%I:%M %p";
        style = "bg:surface0 fg:subtext";
        format = "[  $time ]($style)";
      };

      line_break.disabled = false;

      character = {
        disabled = false;
        success_symbol = "[❯](bold fg:green)";
        error_symbol = "[❯](bold fg:red)";
        vimcmd_symbol = "[❮](bold fg:green)";
        vimcmd_replace_one_symbol = "[❮](bold fg:purple)";
        vimcmd_replace_symbol = "[❮](bold fg:purple)";
        vimcmd_visual_symbol = "[❮](bold fg:blue)";
      };

      package.disabled = true;
      battery.disabled = true;
      aws.disabled = true;
      gcloud.disabled = true;
      azure.disabled = true;
    };
  };
}
