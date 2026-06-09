{
  plugins.diffview = {
    enable = true;
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
