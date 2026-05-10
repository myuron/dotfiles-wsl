{
  programs = {
    nixvim = {
      enable = true;
      vimAlias = true;
      colorschemes.catppuccin.enable = true;
      imports = [
        ./option.nix
        ./keymap.nix
        ./plugin/treesitter.nix
        ./plugin/lsp.nix
        ./plugin/cmp.nix
        # UI
        ./plugin/web-devicons.nix
        ./plugin/bufferline.nix
        # Search
        ./plugin/snacks.nix
        # Edit
        ./plugin/mini-pairs.nix
        ./plugin/mini-surround.nix
      ];
    };
  };
}
