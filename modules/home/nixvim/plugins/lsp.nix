{ ... }:
{
  programs.nixvim.plugins = {

    # ── LSP ───────────────────────────────────────────────────────────────
    lsp = {
      enable = true;

      # Keymaps applied on LSP attach
      keymaps = {
        silent = true;
        lspBuf = {
          "gd" = {
            action = "definition";
            desc = "Go to definition";
          };
          "gD" = {
            action = "declaration";
            desc = "Go to declaration";
          };
          "gr" = {
            action = "references";
            desc = "Go to references";
          };
          "gi" = {
            action = "implementation";
            desc = "Go to implementation";
          };
          "gt" = {
            action = "type_definition";
            desc = "Go to type definition";
          };
          "K" = {
            action = "hover";
            desc = "Hover docs";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "Rename symbol";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code action";
          };
          "<leader>ls" = {
            action = "signature_help";
            desc = "Signature help";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line diagnostics";
          };
          "[d" = {
            action = "goto_prev";
            desc = "Prev diagnostic";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next diagnostic";
          };
        };
      };

      servers = {
        # Web
        ts_ls.enable = true;
        cssls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        emmet_language_server.enable = true;

        # Python
        pyright.enable = true;

        # Lua
        lua_ls = {
          enable = true;
          settings.Lua.diagnostics.globals = [ "vim" ];
        };

        # Nix
        nixd.enable = true;

        # Go
        gopls.enable = true;

        # YAML / TOML / Docker
        yamlls.enable = true;
      };
    };

    # ── Formatting (conform) ──────────────────────────────────────────────
    # NOTE: stylua, prettier, black etc. are in extraPackages in default.nix
    conform-nvim = {
      enable = true;
      settings = {
        # format_on_save = {
        #   enable = false;
        #   lsp_fallback = true;
        #   timeout_ms = 500;
        # };

        format_on_save = null; # I prefer manual formatting with <leader>f

        formatters_by_ft = {
          lua = [ "stylua" ];
          python = [
            "isort"
            "black"
          ];
          javascript = [ "prettier" ];
          typescript = [ "prettier" ];
          javascriptreact = [ "prettier" ];
          typescriptreact = [ "prettier" ];
          css = [ "prettier" ];
          html = [ "prettier" ];
          json = [ "prettier" ];
          yaml = [ "prettier" ];
          markdown = [ "prettier" ];
          nix = [ "nixfmt" ];
          go = [ "gofmt" ];
        };
      };
    };

    # ── Diagnostics panel ─────────────────────────────────────────────────
    trouble = {
      enable = true;
      settings = {
        auto_close = true;
        use_diagnostic_signs = true;
      };
    };

    # ── LSP lines (inline virtual text diagnostics) ───────────────────────
    lsp-lines = {
      enable = true;
      # Toggle with <leader>dl if you find it noisy
    };
  };

  # Show diagnostic symbols in sign column
  programs.nixvim.diagnostic = {
    settings = {
      virtual_text = false; # lsp-lines handles this
      signs = true;
      underline = true;
      update_in_insert = false;
      severity_sort = true;
    };
  };
}
