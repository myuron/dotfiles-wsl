{
  plugins.dap-ui = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>dd";
      action = "<cmd>lua require(\"dapui\").toggle()<CR>";
    }
  ];
}
