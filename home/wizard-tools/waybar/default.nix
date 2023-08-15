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
        color: #${colors.base05};
      }

      #workspaces {
        background: transparent;
        font-weight: bold;
        margin-left: 15px;
      }

      #custom-nix, #workspaces button {
        background-color: #${colors.base00};
        border-radius: 10px;
        border: 0.1px solid #${colors.base03};
        font-size: 20px;
        /* margin-left: 10px; */
        margin-top: 5px;
        padding-top: 1px;
        padding-left: 5px;
        padding-right: 10px;
      }

      #workspaces button {
        opacity: 0.85;
        margin-right: 2px;
      }

      #custom-nix {
        margin-left: 8px;
        color: #${colors.base0D};
      }

      #workspaces button.focused,
      #workspaces button.active {
        opacity: 1;
        background-color: #${colors.base0D};
        color: #${colors.base00};
      }

      #workspaces button.urgent {
        background-color: #${colors.base08};
      }
    '';
  };
}
