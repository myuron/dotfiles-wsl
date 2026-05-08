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
        ./plugin/web-devicons.nix
        ./plugin/snacks.nix
        ./plugin/mini-pairs.nix
        ./plugin/mini-surround.nix
      ];
    };
  };
}
