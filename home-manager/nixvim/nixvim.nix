{
  programs = {
    nixvim = {
      enable = true;
      vimAlias = true;
      # colorschemes.catppuccin.enable = true;
      colorschemes.everforest.enable = true;
      imports = [
        ./option.nix
        ./keymap.nix
        ./plugin/lz-n.nix
        ./plugin/treesitter.nix
        ./plugin/lsp.nix
        ./plugin/lazygit.nix
        ./plugin/trouble.nix
        ./plugin/toggleterm.nix
        ./plugin/diffview.nix
        ./plugin/indent-blankline.nix
        ./plugin/pantran.nix
        # UI
        ./plugin/web-devicons.nix
        ./plugin/bufferline.nix
        ./plugin/lualine.nix
        ./plugin/noice.nix
        ./plugin/dropbar.nix
        ./plugin/notify.nix
        # Search
        ./plugin/snacks.nix
        # Edit
        ./plugin/mini-pairs.nix
        ./plugin/mini-surround.nix
        ./plugin/cmp.nix
      ];
    };
  };
}
