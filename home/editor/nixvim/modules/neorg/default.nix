{pkgs, ...}: {
	imports = [
		./core
	];
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      neorg-telescope
    ];

		plugins.neorg = {
      enable = true;
      modules = {
        "core.defaults" = {__empty = null;};
				"core.dirman" = {
          config = {
            workspaces = {
              cerveauII = "~/CerveauII";
							gtd = "~/CerveauII/GTD";
            };
						index = "Carte.norg";
            default_workspace = "cerveauII";
          };
        };

				"core.journal" = {
					config = {
						journal_folder = "Journal";
						strategy = "nested";
						use_template = true;
						workspace = "cerveauII";
					};
				};
        "core.completion" = {
          config = {
            engine = "nvim-cmp";
						name = "[Norg]";
          };
        };

        "core.concealer" = {__empty = null;};
        "core.ui.calendar" = {__empty = null;};
        "core.summary" = {__empty = null;};

        "core.integrations.telescope" = {__empty = null;};
				"core.integrations.nvim-cmp" = {__empty = null;};
      };
    };
  };
}
