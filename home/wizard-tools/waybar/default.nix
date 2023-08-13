{
  pkgs,
  host,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
    });

    settings = let
      custom-nix = import ./modules/custom-nix.nix;
      workspaces = import ./modules/worskpaces.nix;
    in {
      leftBar = {
        output = ["${host.monitors.left}"];
        layer = "top";
        position = "top";
        height = 30;
        width = 1920;
        modules-left = [
          "custom/nix"
          "wlr/workspaces"
        ];
        "custom/nix" = custom-nix;
        "wlr/workspaces" = workspaces;
      };

      centerBar = {
        output = ["${host.monitors.center}"];
        layer = "top";
        position = "top";
        height = 30;
        width = 1920;
        modules-left = [
          "custom/nix"
          "wlr/workspaces"
        ];
        "custom/nix" = custom-nix;
        "wlr/workspaces" = workspaces;
      };
    };
    style = let
      inherit (config.colorscheme) colors;
    in ''
      * {
        font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};
        font-size: 11pt;
        border: none;
      }

      window#waybar {
        background: transparent;
      }

      #custom-nix, #workspaces {
        background-color: #${colors.base00};
        border-radius: 10px;
        font-weight: bold;
      }

      #custom-nix {
        color: #${colors.base0D};
        font-size: 1.5em;
      }

      #workspaces {
        opacity: 0.80;
      }

      #workspaces button {
        border: 0.1px solid #${colors.base03};
        color: #${colors.base05};
      }

      #workspaces button.focused,
      #workspaces button.active {
        background-color: #${colors.base0D};
      }

      #workspaces button.urgent {
        background-color: #${colors.base08};
      }
    '';
  };
}
