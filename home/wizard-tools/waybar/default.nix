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
          "custom/logo"
          "wlr/workspaces"
        ];
        "custom/logo" = custom-nix;
        "wlr/workspaces" = workspaces;
      };

      centerBar = {
        output = ["${host.monitors.center}"];
        layer = "top";
        position = "top";
        height = 30;
        width = 1920;
        modules-left = [
          "custom/logo"
          "wlr/workspaces"
        ];
        "custom/logo" = custom-nix;
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

      window#waybar.hidden {
        opacity: 0.2;
      }

      #custom-logo {
        font-size: 1.50em;
        padding-left: 1em;
        padding-right: 1em;
        color: #${colors.base0D};
      }

      #workspaces {
        opacity: 0.80;
        background-color: #${colors.base00};
      }

      #workspaces button {
        font-weight: bold;
        border: 0.1px solid #${colors.base03};
        border-radius: 10px;
        color: #${colors.base05};
        margin: 2px;
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
