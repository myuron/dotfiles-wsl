{
  plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        enabled = true;
        preset = {
          header = ''
                                  ███                           ███                 
                        ░░░                           ░░░                  
            ████████   ████  █████ █████ █████ █████ ████  █████████████  
            ░░███░░███ ░░███ ░░███ ░░███ ░░███ ░░███ ░░███ ░░███░░███░░███ 
            ░███ ░███  ░███  ░░░█████░   ░███  ░███  ░███  ░███ ░███ ░███ 
            ░███ ░███  ░███   ███░░░███  ░░███ ███   ░███  ░███ ░███ ░███ 
            ████ █████ █████ █████ █████  ░░█████    █████ █████░███ █████
            ░░░░ ░░░░░ ░░░░░ ░░░░░ ░░░░░    ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ 
          '';
        };
        sections = [
          { section = "header"; }
          { section = "keys"; }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.picker.explorer()<CR>";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<CR>";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
    }
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>lua Snacks.picker.gh_issue()<CR>";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>lua Snacks.picker.gh_pr()<CR>";
    }
  ];
}
