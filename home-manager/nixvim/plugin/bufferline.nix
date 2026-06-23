{
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
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
        separator_style = "thick";
        show_buffer_close_icons = false;
      };
    };
  };
}
