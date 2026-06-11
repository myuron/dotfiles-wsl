{
  plugins.diffview = {
    enable = true;
    lazyLoad.settings.cmd = "DiffviewOpen";
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<CR>";
    }
    {
      mode = "n";
      key = "<leader>gD";
      action = "<cmd>DiffviewClose<CR>";
    }
  ];
}
