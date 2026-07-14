{
  programs = {
    nixvim = {
      enable = true;
      vimAlias = true;
      # colorschemes.solarized-osaka = {
      #   enable = true;
      # };
      colorschemes.ayu = {
        enable = true;
      };
      # colorschemes.kanagawa = {
      #   enable = true;
      #   settings = {
      #     theme = "dragon";
      #   };
      # };
      # colorschemes.catppuccin.enable = true;
      # colorschemes.tokyonight.enable = true;
      # colorschemes.everforest = {
      #   enable = true;
      #   settings = {
      #     background = "hard";
      #     float_style = "bright";
      #     transparent_background = 2;
      #   };
      # };
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
        ./plugin/lspkind.nix
        ./plugin/which-key.nix
        ./plugin/web-devicons.nix
        ./plugin/bufferline.nix
        ./plugin/lualine.nix
        ./plugin/noice.nix
        ./plugin/dropbar.nix
        ./plugin/notify.nix
        ./plugin/snacks.nix
        ./plugin/mini-pairs.nix
        ./plugin/mini-surround.nix
        ./plugin/cmp.nix
        ./plugin/denops.nix
        ./plugin/skkeleton.nix
        ./plugin/cmp-skkeleton.nix
        ./plugin/dap.nix
        ./plugin/dap-ui.nix
        ./plugin/dap-virtual-text.nix
        ./plugin/dap-go.nix
      ];
    };
  };
}
