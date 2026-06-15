{
  plugins.diffview = {
    enable = true;
    lazyLoad.settings.cmd = [
      "DiffviewOpen"
      "DiffviewFileHistory"
    ];
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<CR>";
    }
    {
      mode = "n";
      key = "<leader>gq";
      action = "<cmd>DiffviewClose<CR>";
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<cmd>DiffviewFileHistory %<CR>";
    }
  ];
}
