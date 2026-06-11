{
  plugins.lazygit = {
    enable = true;
    lazyLoad.settings.cmd = "LazyGit";
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
    }
  ];
}
