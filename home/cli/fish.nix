{
  programs.fish = {
    enable = true;

    shellAliases = {
      nn = "nvim";
      nvim = "nix run ~/Projets/config/neovim --";
      cat = "bat";
      find = "fd";
      grep = "ripgrep";
      ls = "exa";
    };

    shellAbbrs = {
      g = "git";
      vim = "nvim";
      vi = "nvim";
      v = "nvim";

      ll = "ls -l";
      lla = "ls -la";
    };
  };
}
