{config, ...}: let
inherit (config.colorscheme) colors;
in {
  programs.fish = {
    enable = true;

    shellAliases = {
      vim = "nix run ~/Projets/config/neovim --";
      cat = "bat";
      find = "fd";
      grep = "ripgrep";
      ls = "exa --icons";
    };

    shellAbbrs = {
      g = "git";
      gcl = "git clone";
      v = "vim";
      neorg = "nvim";

      ll = "ls -l";
      lla = "ls -la";
    };
		functions = {
			fish_greeting = "";
		};
		interactiveShellInit = ''
			set -U fish_color_normal cdd6f4
			set -U fish_color_command 89b4fa
			set -U fish_color_param f2cdcd
			set -U fish_color_keyword f38ba8
			set -U fish_color_quote a6e3a1
			set -U fish_color_redirection f5c2e7
			set -U fish_color_end fab387
			set -U fish_color_comment 7f849c
			set -U fish_color_error f38ba8
			set -U fish_color_gray 6c7086
			set -U fish_color_selection --background=313244
			set -U fish_color_search_match --background=313244
			set -U fish_color_option a6e3a1
			set -U fish_color_operator f5c2e7
			set -U fish_color_escape eba0ac
			set -U fish_color_autosuggestion 6c7086
			set -U fish_color_cancel f38ba8
			set -U fish_color_cwd f9e2af
			set -U fish_color_user 94e2d5
			set -U fish_color_host 89b4fa
			set -U fish_color_host_remote a6e3a1
			set -U fish_color_status f38ba8
			set -U fish_pager_color_progress 6c7086
			set -U fish_pager_color_prefix f5c2e7
			set -U fish_pager_color_completion cdd6f4
			set -U fish_pager_color_description 6c7086
		'' + 
		''
			#set -l rebind true
			#bind --erase --all --preset
			#fish_vi_key_bindings

			#set -l init_mode insert # Le mode dans lequel on arrive

			## Fin de ligne / Début de ligne
			#set -l eol_keys \$ g\$ \u00E7 # $ g$ ç
			#set -l bol_keys \^ 0 g\^ \u00E8 # ^ 0 g^ è

			
		'';
  };
}
