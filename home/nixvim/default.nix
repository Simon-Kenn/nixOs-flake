{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    #./options.nix
    #./bindings.nix
    ./bepo.nix
    #./modules
  ];

  programs.nixvim = {
    enable = true;
    plugins = {
    };

    plugins.treesitter = {
      enable = true;
    };

    plugins.telescope = {
      enable = true;
    };

    plugins.neorg = {
      enable = true;
      modules = {
        "core.defaults" = {__empty = null;};
        "core.concealer" = {__empty = null;};
        "core.dirman" = {
          config = {
            workspaces = {
              notes = "~/notes";
            };
          };
        };
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      flavour = "frappe";
    };

    options = {
      enc = "utf-8";
      fileencoding = "utf-8";

      syntax = "on";
      ruler = true;
      visualbell = true;
      hidden = true;
      number = true;
      relativenumber = true;
      foldmethod = "indent";

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      smarttab = true;
      autoindent = true;
      smartindent = true;
    };

    globals.mapleader = " ";
    globals.localleader = ",";
  };
}
