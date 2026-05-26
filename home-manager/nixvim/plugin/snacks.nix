{
  plugins.snacks = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.picker.explorer()<CR>";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<CR>";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
    }
  ];
}
