{ ... }:
{
  programs.nixvim.plugins = {

    # ── Icons (required by many plugins) ─────────────────────────────────
    web-devicons.enable = true;

    # ── Statusline ────────────────────────────────────────────────────────
    lualine = {
      enable = true;
      settings.options = {
        theme = "tokyonight";
        globalstatus = true;
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };
      };
      settings.sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diff"
          "diagnostics"
        ];
        lualine_c = [ { __raw = "{'filename', path = 1}"; } ];
        lualine_x = [
          "encoding"
          "fileformat"
          "filetype"
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };

    # ── Buffer tabs ───────────────────────────────────────────────────────
    bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
        separator_style = "slant";
        show_buffer_close_icons = true;
        show_close_icon = false;
        always_show_bufferline = true;
        offsets = [
          {
            filetype = "neo-tree";
            text = "  File Explorer";
            highlight = "Directory";
            separator = true;
          }
        ];
      };
    };

    # ── Command/Search UI overhaul ────────────────────────────────────────
    noice = {
      enable = true;
      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        presets = {
          bottom_search = false;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = false;
        };
      };
    };

    # ── Dashboard / Start screen ──────────────────────────────────────────
    alpha = {
      enable = true;
      theme = "dashboard";
    };

    # ── Indent guides ─────────────────────────────────────────────────────
    indent-blankline = {
      enable = true;
      settings = {
        indent.char = "│";
        scope = {
          enabled = true;
          show_start = true;
          show_end = false;
        };
        exclude.filetypes = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "lazy"
          "mason"
          "notify"
        ];
      };
    };

    # ── Breadcrumb (file path + symbol in winbar) ─────────────────────────
    # Shows: src > components > Button.tsx > MyComponent > render
    navic = {
      enable = true;
      settings.lsp.auto_attach = true;
    };
    barbecue = {
      enable = true;
      settings = {
        attach_navic = true;
        show_dirname = false; # hide parent dirs, show only relative path
        show_basename = true;
        show_modified = true;
      };
    };

    # ── LSP progress indicator (bottom-right spinner) ─────────────────────
    fidget = {
      enable = true;
      settings.progress.display.done_icon = "✓";
    };

    # ── TODO/FIXME/HACK comment highlights ───────────────────────────────
    todo-comments = {
      enable = true;
      settings.signs = true;
    };
  };
}
