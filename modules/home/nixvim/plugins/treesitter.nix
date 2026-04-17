{ ... }:
{
  programs.nixvim.plugins = {

    # ── Treesitter ────────────────────────────────────────────────────────
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        auto_install = false; # managed by nix, no need for runtime install

        ensure_installed = [
          "lua"
          "python"
          "go"
          "gomod"
          "gowork"
          "gosum"
          "javascript"
          "typescript"
          "tsx"
          "jsdoc"
          "html"
          "css"
          "json"
          "jsonc"
          "nix"
          "bash"
          "dockerfile"
          "markdown"
          "markdown_inline"
          "yaml"
          "toml"
          "regex"
          "vim"
          "vimdoc"
          "query"
          "gitignore"
        ];

        # Smart incremental selection (expand/shrink node)
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            scope_incremental = false;
            node_decremental = "<bs>";
          };
        };
      };
    };

    # ── Sticky context header (shows current function/class at top) ───────
    treesitter-context = {
      enable = true;
      settings = {
        enable = true;
        max_lines = 3;
        mode = "cursor";
      };
    };

    # ── Automatically close/rename HTML tags ──────────────────────────────
    ts-autotag.enable = true;
  };
}
