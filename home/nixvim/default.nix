{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    plugins = {
      treesitter.enable = true;
      neorg.enable = true;
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

    maps = {
      normalVisualOp."é" = "w";
      normalVisualOp."É" = "W";

      operator."aé" = "aW";
      operator."aÉ" = "aW";
      operator."ié" = "iW";
      operator."iÉ" = "iW";

      normalVisualOp."t" = "h";
      normalVisualOp."n" = "l";
      normalVisualOp."s" = "j";
      normalVisualOp."r" = "k";

      normalVisualOp."T" = "H";
      normalVisualOp."N" = "L";
      normalVisualOp."S" = "J";
      normalVisualOp."R" = "K";

      normalVisualOp."zr" = "zj";
      normalVisualOp."zs" = "zk";

      normalVisualOp."j" = "t";
      normalVisualOp."J" = "T";

      normalVisualOp."l" = "n";
      normalVisualOp."L" = "N";

      normalVisualOp."h" = "r";
      normalVisualOp."H" = "R";

      normalVisualOp."k" = "s";
      normalVisualOp."K" = "S";

      normalVisualOp."]k" = "]s";
      normalVisualOp."[k" = "[s";

      normalVisualOp."gs" = "gk";
      normalVisualOp."gr" = "gj";

      normalVisualOp."gb" = "gT";
      normalVisualOp."gé" = "gt";

      normalVisualOp."gB" = ":exe \"silent! tabfirst\"<CR>";
      normalVisualOp."gÉ" = ":exe \"silent! tablast\"<CR>";

      normalVisualOp."<C>s" = "<C-w>j";
      normalVisualOp."<C>r" = "<C-w>k";
      normalVisualOp."<C>t" = "<C-w>h";
      normalVisualOp."<C>n" = "<C-w>l";
      normalVisualOp."<C>d" = "<C-w>c";
      normalVisualOp."<C>o" = "<C-w>s";
      normalVisualOp."<C>p" = "<C-w>o";

      normalVisualOp."0" = "*";
      normalVisualOp."*" = "0";
      normalVisualOp."\"" = "1";
      normalVisualOp."1" = "\"";
      normalVisualOp."«" = "2";
      normalVisualOp."2" = "«";
      normalVisualOp."»" = "3";
      normalVisualOp."3" = "»";
      normalVisualOp."(" = "4";
      normalVisualOp."4" = "(";
      normalVisualOp.")" = "5";
      normalVisualOp."5" = ")";
      normalVisualOp."@" = "6";
      normalVisualOp."6" = "@";
      normalVisualOp."+" = "7";
      normalVisualOp."7" = "+";
      normalVisualOp."-" = "8";
      normalVisualOp."8" = "-";
      normalVisualOp."/" = "9";
      normalVisualOp."9" = "/";
    };
  };
}
