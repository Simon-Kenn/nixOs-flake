{
  programs.fish = {
    enable = true;

    shellAliases = {
      nvim = "nix run ~/Projets/config/neovim --";
      cat = "bat";
      find = "fd";
      grep = "ripgrep";
      ls = "exa";

      vim = "nvim";
    };

    shellAbbrs = {
      vi = "nvim";
      v = "nvim";

      ll = "ls -l";
      lla = "ls -la";
    };
  };
}
