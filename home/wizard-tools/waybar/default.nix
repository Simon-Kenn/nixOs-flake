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
      clock = import ./modules/clock.nix;
      cpu = import ./modules/cpu.nix;
      memory = import ./modules/memory.nix;
      pulseaudio = import ./modules/pulseaudio.nix;
      network = import ./modules/network.nix;
      custom-hostname = import ./modules/custom-hostname.nix;
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
        modules-center = [
          "cpu"
          "memory"
          "clock"
          "pulseaudio"
        ];
        modules-right = [
          "network"
          "tray"
          "custom/hostname"
        ];
        "custom/nix" = custom-nix;
        "wlr/workspaces" = workspaces;
        "clock" = clock;
        "cpu" = cpu;
        "memory" = memory;
        "pulseaudio" = pulseaudio;
        "network" = network;
        "custom/hostname" = custom-hostname;
      };
    };
    style = let
      inherit (config.colorscheme) colors;
    in ''
      * {
        font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};
        font-size: 11pt;
        border: none;
        /* padding: 0 8px; */
      }

      window#waybar {
        background: transparent;
        color: #${colors.base05};
      }

      .modules-right {
        margin-right: 10px;
        padding-left: 8px;
      }

      .modules-left {
        margin-left: 10px;
        padding-right: 8px;
      }
      .modules-left, .modules-center, .modules-right {
        opacity: 0.85;
        background-color: #${colors.base00};
        border: 1px solid #${colors.base0C};
        border-radius: 10px;
      }

      #workspaces {
        font-weight: bold;
        margin-left: 15px;
      }

      #workspaces button {
        background-color: #${colors.base01};
        color: #${colors.base05};
        margin: 2px;
      }

      #workspaces button.focused,
      #workspaces button.active {
        background-color: #${colors.base0C};
        color: #${colors.base00};
      }

      #workspaces button.urgent {
        background-color: #${colors.base08};
      }

      #custom-nix {
        background-color: #${colors.base0C};
        color: #${colors.base00};
        padding-left: 15;
        padding-right: 22px;
        margin-left: 0;
        margin-right: 10px;
        margin-top: 0;
        margin-bottom: 0;
        border-radius: 10px;
      }
      #custom-hostname {
        background-color: #${colors.base0C};
        color: #${colors.base00};
        padding-left: 15px;
        padding-right: 20;
        margin-left: 0;
        margin-right: 0;
        margin-top: 0;
        margin-bottom: 0;
        border-radius: 10px;
      }

      #tray {
        color: #${colors.base05};
      }

      #clock {
        background-color: #${colors.base0C};
        color: #${colors.base00};
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 0;
        margin-bottom: 0;
        border-radius:10px;
      }
    '';
  };
}
