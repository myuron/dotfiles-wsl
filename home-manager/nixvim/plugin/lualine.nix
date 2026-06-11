{
  plugins.lualine = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings = {
      sections = {
        lualine_z = [
          "location"
          "selectioncount"
        ];
      };
    };
  };
}
