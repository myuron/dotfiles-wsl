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
  ];
}
