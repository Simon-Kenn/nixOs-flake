{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";

      "<leader>fs" = "treesitter";
			"<leader>fd" = "diagnosics";
    };
  };

  programs.nixvim.extraConfigLua = ''
    require('telescope').setup{
      defaults = {
        mappings = {
          i = {
            ["<C-r>"] = "move_selection_previous",
            ["<C-s>"] = "move_selection_next",

            ["<C-c>"] = "close",

            ["<Down>"] = "move_selection_next",
            ["<Up>"] = "move_selection_previous",

            ["<CR>"] = "select_default",
            ["<C-g>"] = "select_horizontal",
            ["<C-v>"] = "select_vertical",
            ["<C-t>"] = "select_tab",

            ["<C-u>"] = "preview_scrolling_up",
            ["<C-d>"] = "preview_scrolling_down",
            ["<C-f>"] = "preview_scrolling_left",
            ["<C-k>"] = "preview_scrolling_right",

            ["<PageUp>"] = "results_scrolling_up",
            ["<PageDown>"] = "results_scrolling_down",
            ["<M-f>"] = "results_scrolling_left",
            ["<M-k>"] = "results_scrolling_right",

          },

          n = {
            ["<esc>"] = "close",
            ["<CR>"] = "select_default",
            ["<C-h>"] = "select_horizontal",
            ["<C-g>"] = "select_vertical",
            ["<C-t>"] = "select_tab",

            ["j"] = "move_selection_next",
            ["k"] = "move_selection_previous",
            ["H"] = "move_to_top",
            ["M"] = "move_to_middle",
            ["L"] = "move_to_bottom",

            ["<Down>"] = "move_selection_next",
            ["<Up>"] = "move_selection_previous",
            ["gg"] = "move_to_top",
            ["G"] = "move_to_bottom",

            ["<C-u>"] = "preview_scrolling_up",
            ["<C-d>"] = "preview_scrolling_down",

            ["<PageUp>"] = "results_scrolling_up",
            ["<PageDown>"] = "results_scrolling_down",

            ["?"] = "which_key",
          }
        }
      }
    };
  '';
}
