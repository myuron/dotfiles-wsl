{
  plugins.lsp = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPre"
      "BufNewFile"
    ];
    servers = {
      nixd = {
        enable = true;
      };
      gopls = {
        enable = true;
      };
      jdtls = {
        enable = true;
      };
      # yaml-language-server = { enable = true; };
      yamlls = {
        enable = true;
      };
      terraform_lsp = {
        enable = true;
      };
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
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
    {
      mode = "n";
      key = "gr";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
    }
  ];
}
