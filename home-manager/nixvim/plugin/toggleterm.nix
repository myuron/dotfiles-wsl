{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {
        border = "curved";
        # height = 30;
        # width = 130;
      };
      # open_mapping = "[[<c-\\]]";
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "sT";
      action = "<cmd>ToggleTerm<CR>";
    }
  ];
}
