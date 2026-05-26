{
  plugins.lazygit = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
    }
  ];
}
