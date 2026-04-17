{ ... }:
{
  programs.nixvim.plugins = {

    # ── File Explorer ─────────────────────────────────────────────────────
    neo-tree = {
      enable = true;
      settings = {
        window = {
          width = 30;
          position = "right";
        };
        filesystem = {
          filtered_items = {
            visible = true;
            hide_dotfiles = false;
            hide_hidden = false;
            hide_by_name = [
              ".git"
            ];
          };
          follow_current_file.enabled = true;
          use_libuv_file_watcher = true;
        };
        default_component_configs.indent.with_expanders = true;
      };
    };

    # ── Auto pairs ( [], {}, (), "" ) ─────────────────────────────────────
    nvim-autopairs = {
      enable = true;
      settings = {
        check_ts = true; # use treesitter for smarter pairing
        ts_config = {
          java = false;
        };
        fast_wrap = { }; # <Alt-e> to fast-wrap selection
      };
    };

    # ── Commenting (gcc / gc in visual) ───────────────────────────────────
    comment = {
      enable = true;
      settings = {
        opleader = {
          line = "gc";
          block = "gb";
        };
        mappings = {
          basic = true;
          extra = true;
        };
      };
    };

    # ── Surround (ys, cs, ds for quotes/brackets/tags) ────────────────────
    nvim-surround.enable = true;

    # ── Which-key (keybinding hints popup) ───────────────────────────────
    which-key = {
      enable = true;
      settings = {
        delay = 300;
        # Group names shown in which-key popup
        spec = [
          {
            __unkeyed-1 = "<leader>f";
            group = "󰍉 Find";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = " Git";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = " Splits";
          }
          {
            __unkeyed-1 = "<leader>x";
            group = " Trouble";
          }
          {
            __unkeyed-1 = "<leader>b";
            group = " Buffer";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = " Code";
          }
          {
            __unkeyed-1 = "<leader>r";
            group = " Rename";
          }
          {
            __unkeyed-1 = "<leader>l";
            group = " LSP";
          }
        ];
      };
    };

    # ── Flash (fast motion / jump) ────────────────────────────────────────
    # Press `s` then 1-2 chars to jump anywhere on screen
    flash = {
      enable = true;
      settings = {
        modes = {
          search.enabled = false; # don't hijack / search
          char = {
            enabled = true;
            jump_labels = true;
          };
        };
      };
    };

    # ── Undotree (visual undo history) ────────────────────────────────────
    undotree = {
      enable = true;
      settings = {
        FocusOnToggle = true;
        SetFocusWhenToggle = true;
      };
    };

    # ── Highlight color codes inline (#fff, rgb(), etc.) ──────────────────
    nvim-colorizer = {
      enable = true;
      userDefaultOptions = {
        css = true;
        html = true;
        names = false;
      };
    };
  };
}
