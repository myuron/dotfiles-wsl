{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd = { enable = true; };
      gopls = { enable = true; };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "gk";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
    }
    {
      mode = "n";
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
    }
  ];
}
