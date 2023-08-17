{
  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = ",";

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

      foldmethod = "syntax";
      foldenable = false;
      foldlevel = 99;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      smarttab = true;
      autoindent = true;
      smartindent = true;
    };
  };
}
