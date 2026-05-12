{
  keymaps = [
    {
      mode = "i";
      key = "jj";
      action = "<ESC>";
    }
    {
      mode = "n";
      key = "<ESC><ESC>";
      action = "<cmd>nohlsearch<CR>";
    }
    # --------------------------------------------------
    # Window Management
    # --------------------------------------------------
    {
      mode = "n";
      key = "ss";
      action = "<cmd>split<CR>";
    }
    {
      mode = "n";
      key = "sv";
      action = "<cmd>vsplit<CR>";
    }
    {
      mode = "n";
      key = "st";
      action = "<cmd>terminal<CR>";
    }
    {
      mode = "n";
      key = "sh";
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "sj";
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "sk";
      action = "<C-w>k";
    }
    {
      mode = "n";
      key = "sl";
      action = "<C-w>l";
    }
    # --------------------------------------------------
    # Buffer Management
    # --------------------------------------------------
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>bnext<CR>";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>bprev<CR>";
    }
  ];
}
