{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        offsets = [
          {
            filetype = "snacks_layout_box";
            text = "File Explorer";
          }
          {
            filetype = "trouble";
            text = "Symbol";
          }
        ];
        indicator = {
          style = "underline";
        };
        separator_style = "slant";
      };
    };
  };
}
