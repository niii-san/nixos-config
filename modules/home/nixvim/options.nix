{ ... }:
{
  programs.nixvim.opts = {

    # ── Clipboard & Mouse ─────────────────────────────────────────────────
    clipboard = "unnamedplus";
    mouse = "a";

    # ── Splits ────────────────────────────────────────────────────────────
    splitbelow = true;
    splitright = true;

    # ── Colors ────────────────────────────────────────────────────────────
    termguicolors = true;

    # ── Indentation ───────────────────────────────────────────────────────
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;
    expandtab = true;
    shiftround = true;
    smartindent = true;

    # ── Line Numbers ──────────────────────────────────────────────────────
    number = true;
    relativenumber = true;
    cursorline = true;
    signcolumn = "yes";
    # colorcolumn = "80";

    # ── Appearance ────────────────────────────────────────────────────────
    wrap = false;
    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      extends = ">";
      precedes = "<";
    };

    # ── Search ────────────────────────────────────────────────────────────
    ignorecase = true;
    smartcase = true;
    incsearch = true;
    hlsearch = true;

    # ── Files ─────────────────────────────────────────────────────────────
    swapfile = false;
    backup = false;
    writebackup = false;
    undofile = true; # persistent undo across sessions

    # ── Folding ───────────────────────────────────────────────────────────
    foldmethod = "indent";
    foldlevel = 99;
    foldenable = false;

    # ── Performance ───────────────────────────────────────────────────────
    updatetime = 250; # faster CursorHold events (gitsigns, etc.)
    timeoutlen = 300; # which-key popup delay

    # ── Completion ────────────────────────────────────────────────────────
    completeopt = "menu,menuone,noinsert";

    # ── Scrolling ─────────────────────────────────────────────────────────
    scrolloff = 8;
    sidescrolloff = 8;
  };
}
