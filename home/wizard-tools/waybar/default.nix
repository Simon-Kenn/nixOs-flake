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
      logo = import ./modules/logo.nix;
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
          #"hyprland/window"
        ];
        "custom/logo" = logo;
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
          #"hyprland/window"
        ];
        "custom/logo" = logo;
        "wlr/workspaces" = workspaces;
      #"hyprland/window" = {
      #  format = "{}";
      #  separate-outputs = true;
      #};
    };
    style = let
      inherit (config.colorscheme) colors;
    in ''
      * {
        font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};

        font-size: 11pt;
      }

      window#waybar {
        opacity: 0.95;
        color: #${colors.base05};
        background-color: #${colors.base00};
        border: 2px solid #${colors.base03};
        border-radius: 10px;
      }

      #custom-logo {
        font-size: 1.50em;
        padding-left: 1em;
        padding-right: 1em;
        color: #${colors.base0D};
      }
    '';
  };
}
