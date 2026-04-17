{ ... }:
{
  programs.nixvim.keymaps = [

    # ── General ───────────────────────────────────────────────────────────
    # {
    #   mode = "n";
    #   key = "<leader>w";
    #   action = "<cmd>w<CR>";
    #   options = {
    #     silent = true;
    #     desc = "Save file";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>q";
    #   action = "<cmd>q<CR>";
    #   options = {
    #     silent = true;
    #     desc = "Quit";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>Q";
    #   action = "<cmd>qa!<CR>";
    #   options = {
    #     silent = true;
    #     desc = "Force quit all";
    #   };
    # }
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>noh<CR>";
      options = {
        silent = true;
        desc = "Clear search highlight";
      };
    }

    # Move lines up/down (Alt+j/k)
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<CR>==";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<CR>==";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selection down";
      };
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selection up";
      };
    }

    # Stay in indent mode in visual
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
        desc = "Indent left (stay selected)";
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
        desc = "Indent right (stay selected)";
      };
    }

    # Better up/down on wrapped lines
    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        silent = true;
        expr = true;
        desc = "Down (respects wrap)";
      };
    }
    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        silent = true;
        expr = true;
        desc = "Up (respects wrap)";
      };
    }

    # ── Splits / Windows ──────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>sv";
      action = "<cmd>vsplit<CR>";
      options = {
        silent = true;
        desc = "Split vertical";
      };
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>split<CR>";
      options = {
        silent = true;
        desc = "Split horizontal";
      };
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        silent = true;
        desc = "Window left";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        silent = true;
        desc = "Window down";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        silent = true;
        desc = "Window up";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        silent = true;
        desc = "Window right";
      };
    }
    # Resize splits
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<CR>";
      options = {
        silent = true;
        desc = "Resize up";
      };
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<CR>";
      options = {
        silent = true;
        desc = "Resize down";
      };
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<CR>";
      options = {
        silent = true;
        desc = "Resize left";
      };
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<CR>";
      options = {
        silent = true;
        desc = "Resize right";
      };
    }

    # ── Buffers ───────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = {
        silent = true;
        desc = "Next buffer";
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = {
        silent = true;
        desc = "Prev buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bd<CR>";
      options = {
        silent = true;
        desc = "Close buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>%bd|e#|bd#<CR>";
      options = {
        silent = true;
        desc = "Close other buffers";
      };
    }

    # ── File Explorer (Neo-tree) ───────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        silent = true;
        desc = "Toggle file explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Neotree focus<CR>";
      options = {
        silent = true;
        desc = "Focus file explorer";
      };
    }

    # ── Telescope ─────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options = {
        silent = true;
        desc = "Find files";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options = {
        silent = true;
        desc = "Live grep";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options = {
        silent = true;
        desc = "Find buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options = {
        silent = true;
        desc = "Help tags";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<CR>";
      options = {
        silent = true;
        desc = "Recent files";
      };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>Telescope diagnostics<CR>";
      options = {
        silent = true;
        desc = "Diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>Telescope lsp_document_symbols<CR>";
      options = {
        silent = true;
        desc = "Document symbols";
      };
    }
    {
      mode = "n";
      key = "<leader>fw";
      action = "<cmd>Telescope grep_string<CR>";
      options = {
        silent = true;
        desc = "Grep word under cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>Telescope git_commits<CR>";
      options = {
        silent = true;
        desc = "Git commits";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Telescope git_branches<CR>";
      options = {
        silent = true;
        desc = "Git branches";
      };
    }

    # ── LSP ───────────────────────────────────────────────────────────────
    # (Most LSP keymaps are defined in plugins/lsp.nix via lsp.keymaps)
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>lua require('conform').format({ async = true })<CR>";
      options = {
        silent = true;
        desc = "Format file";
      };
    }

    # ── Trouble (Diagnostics) ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Trouble";
      };
    }
    {
      mode = "n";
      key = "<leader>xd";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
      options = {
        silent = true;
        desc = "Buffer diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>Trouble loclist toggle<CR>";
      options = {
        silent = true;
        desc = "Location list";
      };
    }
    {
      mode = "n";
      key = "<leader>xq";
      action = "<cmd>Trouble qflist toggle<CR>";
      options = {
        silent = true;
        desc = "Quickfix list";
      };
    }

    # ── Undotree ──────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle undo tree";
      };
    }

    # ── Git (Gitsigns) ────────────────────────────────────────────────────
    {
      mode = "n";
      key = "]h";
      action = "<cmd>Gitsigns next_hunk<CR>";
      options = {
        silent = true;
        desc = "Next git hunk";
      };
    }
    {
      mode = "n";
      key = "[h";
      action = "<cmd>Gitsigns prev_hunk<CR>";
      options = {
        silent = true;
        desc = "Prev git hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options = {
        silent = true;
        desc = "Preview hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Stage hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options = {
        silent = true;
        desc = "Reset hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>Gitsigns stage_buffer<CR>";
      options = {
        silent = true;
        desc = "Stage buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>gu";
      action = "<cmd>Gitsigns undo_stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Undo stage hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options = {
        silent = true;
        desc = "Diff this";
      };
    }

    # ── CopilotChat ───────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>CopilotChatToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Copilot Chat";
      };
    }
    {
      mode = "n";
      key = "<leader>ce";
      action = "<cmd>CopilotChatExplain<CR>";
      options = {
        silent = true;
        desc = "Explain code";
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>CopilotChatFix<CR>";
      options = {
        silent = true;
        desc = "Fix code";
      };
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>CopilotChatReview<CR>";
      options = {
        silent = true;
        desc = "Review code";
      };
    }
    {
      mode = "n";
      key = "<leader>ct";
      action = "<cmd>CopilotChatTests<CR>";
      options = {
        silent = true;
        desc = "Generate tests";
      };
    }
    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>CopilotChatOptimize<CR>";
      options = {
        silent = true;
        desc = "Optimize code";
      };
    }
    {
      mode = "v";
      key = "<leader>cc";
      action = ":CopilotChatToggle<CR>";
      options = {
        silent = true;
        desc = "Chat about selection";
      };
    }
    {
      mode = "v";
      key = "<leader>ce";
      action = ":CopilotChatExplain<CR>";
      options = {
        silent = true;
        desc = "Explain selection";
      };
    }
    {
      mode = "v";
      key = "<leader>cf";
      action = ":CopilotChatFix<CR>";
      options = {
        silent = true;
        desc = "Fix selection";
      };
    }
    {
      mode = "v";
      key = "<leader>ct";
      action = ":CopilotChatTests<CR>";
      options = {
        silent = true;
        desc = "Generate tests for selection";
      };
    }

    # ── Flash (Jump) ──────────────────────────────────────────────────────
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action = "<cmd>lua require('flash').jump()<CR>";
      options = {
        silent = true;
        desc = "Flash jump";
      };
    }
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action = "<cmd>lua require('flash').treesitter()<CR>";
      options = {
        silent = true;
        desc = "Flash treesitter";
      };
    }

    # ── Copilot Chat ──────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>CopilotChat<CR>";
      options = {
        silent = true;
        desc = "Copilot chat";
      };
    }
    {
      mode = "n";
      key = "<leader>cm";
      action = "<cmd>CopilotChatModels<CR>";
      options = {
        silent = true;
        desc = "Select Copilot model";
      };
    }
    {
      mode = "n";
      key = "<leader>ce";
      action = "<cmd>CopilotChatExplain<CR>";
      options = {
        silent = true;
        desc = "Explain code";
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>CopilotChatFix<CR>";
      options = {
        silent = true;
        desc = "Fix code";
      };
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>CopilotChatReview<CR>";
      options = {
        silent = true;
        desc = "Review code";
      };
    }
    {
      mode = "v";
      key = "<leader>cc";
      action = "<cmd>CopilotChat<CR>";
      options = {
        silent = true;
        desc = "Chat about selection";
      };
    }
    {
      mode = "v";
      key = "<leader>ce";
      action = "<cmd>CopilotChatExplain<CR>";
      options = {
        silent = true;
        desc = "Explain selection";
      };
    }

    # ── Todo Comments ─────────────────────────────────────────────────────
    {
      mode = "n";
      key = "]t";
      action = "<cmd>lua require('todo-comments').jump_next()<CR>";
      options = {
        silent = true;
        desc = "Next TODO";
      };
    }
    {
      mode = "n";
      key = "[t";
      action = "<cmd>lua require('todo-comments').jump_prev()<CR>";
      options = {
        silent = true;
        desc = "Prev TODO";
      };
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>TodoTelescope<CR>";
      options = {
        silent = true;
        desc = "Find TODOs";
      };
    }
  ];
}
