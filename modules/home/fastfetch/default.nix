{ ... }:
{
  home.file.".config/fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "builtin",
        "source": "nixos_small",
        "color": {
          "1": "38;2;130;170;255",
          "2": "38;2;134;225;252"
        },
        "padding": {
          "top": 2,
          "left": 1,
          "right": 3
        }
      },
      "display": {
        "separator": "",
        "color": "38;2;130;170;255"
      },
      "modules": [
        {
          "type": "custom",
          "format": "\u001b[38;2;47;51;77m╭──────────────────────────────────────────╮\u001b[0m"
        },
        {
          "type": "custom",
          "format": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[1;38;2;192;153;255m󱄅  nishansys\u001b[38;2;130;139;184m@\u001b[38;2;134;225;252mnixos\u001b[0m"
        },
        {
          "type": "custom",
          "format": "\u001b[38;2;47;51;77m├──────────────────────────────────────────┤\u001b[0m"
        },
        {
          "type": "os",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m󱄅  OS        \u001b[38;2;47;51;77m│\u001b[0m",
          "format": " {2} {4}"
        },
        {
          "type": "kernel",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m  Kernel    \u001b[38;2;47;51;77m│\u001b[0m",
          "format": " {1}"
        },
        {
          "type": "uptime",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m󰔟  Uptime    \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "packages",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m󰏖  Packages  \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "shell",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m  Shell     \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "display",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m󰍹  Display   \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "wm",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m󱂬  WM        \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "terminal",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;134;225;252m  Terminal  \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "custom",
          "format": "\u001b[38;2;47;51;77m├──────────────────────────────────────────┤\u001b[0m"
        },
        {
          "type": "cpu",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;255;199;119m  CPU       \u001b[38;2;47;51;77m│\u001b[0m",
          "showPeCoreCount": true,
          "temp": true,
          "format": " {1} ({3}) @ {7} GHz"
        },
        {
          "type": "gpu",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;255;199;119m󰍲  GPU       \u001b[38;2;47;51;77m│\u001b[0m",
          "detectionMethod": "pci",
          "format": " {1} {2}"
        },
        {
          "type": "memory",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;255;199;119m󰘚  Memory    \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "disk",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;255;199;119m󰋊  Disk      \u001b[38;2;47;51;77m│\u001b[0m",
          "folders": "/"
        },
        {
          "type": "battery",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;255;199;119m󰁹  Battery   \u001b[38;2;47;51;77m│\u001b[0m"
        },
        {
          "type": "custom",
          "format": "\u001b[38;2;47;51;77m├──────────────────────────────────────────┤\u001b[0m"
        },
        {
          "type": "colors",
          "key": "\u001b[38;2;47;51;77m│\u001b[0m  \u001b[38;2;192;153;255m  Colors    \u001b[38;2;47;51;77m│\u001b[0m",
          "symbol": "circle",
          "paddingLeft": 2
        },
        {
          "type": "custom",
          "format": "\u001b[38;2;47;51;77m╰──────────────────────────────────────────╯\u001b[0m"
        }
      ]
    }
  '';
}
