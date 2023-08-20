{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      neorg-telescope
    ];
    plugins.neorg = {
      enable = true;
      modules = {
        "core.defaults" = {__empty = null;};
        "core.keybinds" = {
          config = {
            hook = {};
          };
        };

        "core.completion" = {
          config = {
            engine = "nvim-cmp";
          };
        };

        "core.concealer" = {__empty = null;};
        "core.ui.calendar" = {__empty = null;};
        "core.summary" = {__empty = null;};

        "core.dirman" = {
          config = {
            workspaces = {
              notes = "~/Notes";
            };
            default_workspace = "notes";
          };
        };
      };
    };
  };
}