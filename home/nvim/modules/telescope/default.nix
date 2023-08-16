{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
  ];

  programs.neovim.extraConfig = ''
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  '';

  programs.neovim.extraLuaConfig = ''
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
  '';
}
