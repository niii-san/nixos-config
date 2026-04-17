{ pkgs, inputs, ... }:
{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins/ui.nix
    ./plugins/lsp.nix
    ./plugins/completion.nix
    ./plugins/treesitter.nix
    ./plugins/telescope.nix
    ./plugins/editor.nix
    ./plugins/git.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # ── Globals ──────────────────────────────────────────────────────────
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # ── Colorscheme ───────────────────────────────────────────────────────
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "moon";
        transparent = false;
        terminal_colors = true;
        styles = {
          comments.italic = true;
          keywords.italic = true;
        };
      };
    };

    # ── System packages available inside Neovim ───────────────────────────
    # Formatters, LSP tools, and utilities
    extraPackages = with pkgs; [
      stylua # Lua formatter
      prettier # JS/TS/CSS/JSON formatter
      black # Python formatter
      isort # Python import sorter
      nixfmt # Nix formatter
      ripgrep # Telescope live grep
      fd # Telescope file finder
    ];
  };
}
