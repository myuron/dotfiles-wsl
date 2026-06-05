{
  plugins.trouble = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "gs";
      action = "<cmd>Trouble symbols toggle focus=false<CR>";
    }
    {
      mode = "n";
      key = "gl";
      action = "<cmd>Trouble diagnostics toggle<CR>";
    }
  ];
}
