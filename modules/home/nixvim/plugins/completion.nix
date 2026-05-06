{ ... }:
{
  programs.nixvim.plugins = {

    # GitHub Copilot
    copilot-lua = {
      enable = true;
      settings = {
        suggestion = {
          enabled = true;
          auto_trigger = true;
          keymap = {
            accept = "<M-l>";
            next = "<M-]>";
            prev = "<M-[>";
            dismiss = "<M-e>";
          };
        };
        panel.enabled = false;
        filetypes = {
          markdown = true;
          help = false;
        };
      };
    };

    copilot-cmp.enable = false;

    # CopilotChat
    copilot-chat = {
      enable = true;
      settings = {
        model = "gpt-4o";
        auto_follow_cursor = true;
        show_help = true;
        window = {
          layout = "vertical";
          width = 0.35;
        };
        mappings = {
          complete.insert = "<Tab>";
          close.normal = "q";
          reset.normal = "<C-r>";
          submit_prompt.insert = "<C-s>";
        };
      };
    };

    # Snippets
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
    };
    friendly-snippets.enable = true;

    # Completion
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        # preselect.__raw = "cmp.PreselectMode.None";
        experimental.ghost_text = true;

        snippet.expand.__raw = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        mapping = {
          "<C-n>".__raw = "cmp.mapping.select_next_item()";
          "<C-p>".__raw = "cmp.mapping.select_prev_item()";
          "<C-b>".__raw = "cmp.mapping.scroll_docs(-4)";
          "<C-f>".__raw = "cmp.mapping.scroll_docs(4)";
          "<C-Space>".__raw = "cmp.mapping.complete()";
          "<C-e>".__raw = "cmp.mapping.abort()";
          "<CR>".__raw = "cmp.mapping.confirm({ select = true })";
          "<Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local cmp     = require('cmp')
              local luasnip = require('luasnip')
              if cmp.visible() then
                if cmp.get_selected_entry() then
                  cmp.confirm({ select = false })
                else
                  cmp.select_next_item()
                end
              elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" })
          '';
          "<S-Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local cmp     = require('cmp')
              local luasnip = require('luasnip')
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
        };

        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "buffer";
            priority = 500;
          }
          {
            name = "path";
            priority = 250;
          }
        ];

        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
  };
}
