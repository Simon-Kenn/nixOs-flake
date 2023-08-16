{pkgs, ...}: {
  imports = [
    ./modules
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    plugins = with pkgs.vimPlugins; [
      neorg
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      neorg-telescope
      nvim-treesitter.withAllGrammars
    ];

    extraLuaConfig = ''
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true
        }
      }

      require("telescope").setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        };
      }

      require('telescope').load_extension('fzf');

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
