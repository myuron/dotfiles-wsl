{
  plugins.dap = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<F5>";
      action = "<cmd>DapToggleBreakpoint<CR>";
    }
    {
      mode = "n";
      key = "<F6>";
      action = "<cmd>DapContinue<CR>";
    }
    {
      mode = "n";
      key = "<F7>";
      action = "<cmd>DapStepInto<CR>";
    }
    {
      mode = "n";
      key = "<F8>";
      action = "<cmd>DapStepOver<CR>";
    }
    {
      mode = "n";
      key = "<F9>";
      action = "<cmd>DapStepOut<CR>";
    }
    {
      mode = "n";
      key = "<F10>";
      action = "<cmd>DapTerminate<CR>";
    }
    {
      mode = "n";
      key = "<S-F10>";
      action = "<cmd>DapDisconnect<CR>";
    }
  ];
}
