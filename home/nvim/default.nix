{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      neorg
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      neorg-telescope
      nvim-treesitter.withAllGrammars
    ];

    extraConfig = builtins.readFile ./vimrc;

    extraLuaConfig = ''
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true
        }
      }
      require("neorg").setup {
        load = {

          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.ui.calendar"] = {},
          ["core.summary"] = {},

          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Notes"
              },
              default_workspace = "notes";
            }
          }
        }
      }
    '';
  };
}
