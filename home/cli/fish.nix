{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      vim = "nvim";
      vi = "nvim";
      v = "nvim";

      cat = "bat";
      fd = "find";
      grep = "ripgrep";

      ls = "exa";
      ll = "exa -l";
    };

    shellAliases = {
      nvim = "nix run ~/Projets/config/neovim --";
    };
  };
}
