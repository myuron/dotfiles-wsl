{
  plugins.dap = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<F5>";
      action = "<cmd>lua require'dap'.continue()<CR>";
    }
    {
      mode = "n";
      key = "<F10>";
      action = "<cmd>lua require'dap'.step_over()<CR>";
    }
    {
      mode = "n";
      key = "<F11>";
      action = "<cmd>lua require'dap'.step_over()<CR>";
    }
    {
      mode = "n";
      key = "<F12>";
      action = "<cmd>lua require'dap'.step_out()<CR>";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>lua require'dap'.toggle_breakpoint()<CR>";
    }
  ];
}
