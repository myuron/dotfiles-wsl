{
  plugins.dap-ui = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>d";
      action = "<cmd>lua require'dapui'.toggle()<CR>";
    }
  ];
}
