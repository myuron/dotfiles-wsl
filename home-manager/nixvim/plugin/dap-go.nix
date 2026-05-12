{
  plugins.dap-go = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>lua require'dap-go'.degub_test()<CR>";
    }
  ];
}
