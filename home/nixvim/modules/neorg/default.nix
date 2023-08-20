{pkgs, ...}: {
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      neorg-telescope
    ];

		plugins.neorg = {
      enable = true;
      modules = {
        "core.defaults" = {__empty = null;};
        "core.keybinds" = {
          config = {
            hook = {};
          };
        };
        "core.completion" = {
          config = {
            engine = "nvim-cmp";
          };
        };

        "core.concealer" = {__empty = null;};
        "core.ui.calendar" = {__empty = null;};
        "core.summary" = {__empty = null;};

        "core.dirman" = {
          config = {
            workspaces = {
              notes = "~/Notes";
            };
            default_workspace = "notes";
          };
        };
      };
    };
		extraConfigLua = ''
			require('neorg').setup {
				load = {
					["core.esupports.metagen"] = {
						config = {
							type = "auto",
							delimiter = ": ",
							template = {
								{
									"titre",
									function()
										return vim.fn.expand("%:p:t:r")
									end
								},
								{
									"catégories",
									""
								},
								{
									"création",
									function()
										return os.date("%Y-%m-%d")
									end
								},
								{
									"modification",
									function()
										return os.date("%Y-%m-%d")
									end
								},
							}
						}
					}
				}
			}
		'';
  };
}
