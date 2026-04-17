{ ... }:
{
  programs.nixvim.plugins = {

    # ── Telescope ─────────────────────────────────────────────────────────
    telescope = {
      enable = true;

      # fzf native for faster sorting
      extensions.fzf-native.enable = true;

      settings = {
        defaults = {
          prompt_prefix = "   ";
          selection_caret = "  ";
          entry_prefix = "  ";
          sorting_strategy = "ascending";
          layout_strategy = "horizontal";
          layout_config = {
            horizontal = {
              prompt_position = "top";
              preview_width = 0.55;
              results_width = 0.8;
            };
            vertical.mirror = false;
            width = 0.87;
            height = 0.80;
            preview_cutoff = 120;
          };
          file_ignore_patterns = [
            "node_modules"
            ".git/"
            "dist/"
            "build/"
            "%.lock"
            "%.min.js"
            "__pycache__"
          ];
          # Use ripgrep when available
          vimgrep_arguments = [
            "rg"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            "--hidden"
            "--glob=!.git/"
          ];
        };
        pickers = {
          find_files = {
            hidden = true;
            find_command = [
              "fd"
              "--type"
              "f"
              "--hidden"
              "--exclude"
              ".git"
            ];
          };
          live_grep.additional_args = [ "--hidden" ];
          buffers = {
            show_all_buffers = true;
            sort_mru = true;
            mappings.i."<C-d>" = "delete_buffer";
          };
        };
      };
    };
  };
}
