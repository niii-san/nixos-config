{ ... }:
{
  programs.nixvim.plugins = {

    # ── Gitsigns (hunk signs, blame, diff) ───────────────────────────────
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "│";
          change.text = "│";
          delete.text = "󰍵";
          topdelete.text = "‾";
          changedelete.text = "~";
          untracked.text = "│";
        };
        signs_staged_enable = true;
        current_line_blame = false; # toggle with <leader>tb if needed
        current_line_blame_opts = {
          delay = 1000;
          virt_text_pos = "eol";
        };
        watch_gitdir.follow_files = true;
        attach_to_untracked = true;
        diff_opts.internal = true;
      };
    };
  };
}
