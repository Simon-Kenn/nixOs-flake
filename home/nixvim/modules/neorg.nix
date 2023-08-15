{
  programs.nixvim.plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = {__empty = null;};
      "core.keybinds" = {
        config = {
        };
      };

      "core.completion" = {
        config = {
          engine = "nvim-cmp";
        };
      };

      "core.concealer" = {};
      "core.dirman" = {
        config = {
          workspaces = {
            notes = "~/notes";
          };
          default_workspace = "notes";
        };
      };
    };
  };
}
