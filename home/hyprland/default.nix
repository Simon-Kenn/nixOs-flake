{config, pkgs, ...}: {
  imports = [
    ./settings.nix
    ./workspaces.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec = [
        "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
      ];
      bind = let
        wofi = "${config.programs.wofi.package}/bin/wofi";
        terminal = config.home.sessionVariables.TERMINAL;
      in [
        "SUPER,Return,exec,${terminal}"
        "SUPER,space,exec,${wofi} -S drun"
        "SUPER,h,exec,${wofi} -S run"
      ];
    };
    extraConfig = ''
      exec-once = waybar & logseq & kitty & firefox & mako
      exec=swaybg -m fill -i ~/.local/share/wallpapers/abstract_ghost.jpg


      # BINDINGS
      # --------
      $mainMod = SUPER

      # Exec
      # bind = $mainMod, RETURN, exec, kitty
      # bind = $mainMod, SPACE, exec, wofi --show drun
      bind = $mainMod, L, exec, swaylock --grace 0 --fade-in 0


      # Window operation
      bind = $mainMod, C, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, F, fullscreen

      # WINDOWS FOCUS
      bind = $mainMod, t, movefocus, l
      bind = $mainMod, n, movefocus, r
      bind = $mainMod, r, movefocus, u
      bind = $mainMod, s, movefocus, d

      bind = ALT, t, movewindow, l
      bind = ALT, n, movewindow, r
      bind = ALT, r, movewindow, u
      bind = ALT, s, movewindow, d


      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, quotedbl, workspace, 1
      bind = $mainMod, guillemotleft, workspace, 2
      bind = $mainMod, guillemotright, workspace, 3
      bind = $mainMod, parenleft, workspace, 7
      bind = $mainMod, parenright, workspace, 8
      bind = $mainMod, at, workspace, 9
      bind = $mainMod, plus, workspace, 10
      bind = $mainMod, minus, workspace, 4
      bind = $mainMod, slash, workspace, 5
      bind = $mainMod, asterisk, workspace, 6


      bind = $mainMod, right, workspace, +1
      bind = $mainMod, left, workspace, -1

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, quotedbl, movetoworkspace, 1
      bind = $mainMod SHIFT, guillemotleft, movetoworkspace, 2
      bind = $mainMod SHIFT, guillemotright, movetoworkspace, 3
      bind = $mainMod SHIFT, parenleft, movetoworkspace, 7
      bind = $mainMod SHIFT, parenright, movetoworkspace, 8
      bind = $mainMod SHIFT, at, movetoworkspace, 9
      bind = $mainMod SHIFT, plus, movetoworkspace, 10
      bind = $mainMod SHIFT, minus, movetoworkspace, 4
      bind = $mainMod SHIFT, slash, movetoworkspace, 5
      bind = $mainMod SHIFT, asterisk, movetoworkspace, 6

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SUPER_CTRL, quotedbl, movetoworkspacesilent, 1
      bind = $mainMod SUPER_CTRL, guillemotleft, movetoworkspacesilent, 2
      bind = $mainMod SUPER_CTRL, guillemotright, movetoworkspacesilent, 3
      bind = $mainMod SUPER_CTRL, parenleft, movetoworkspacesilent, 7
      bind = $mainMod SUPER_CTRL, parenright, movetoworkspacesilent, 8
      bind = $mainMod SUPER_CTRL, at, movetoworkspacesilent, 9
      bind = $mainMod SUPER_CTRL, plus, movetoworkspacesilent, 10
      bind = $mainMod SUPER_CTRL, minus, movetoworkspacesilent, 4
      bind = $mainMod SUPER_CTRL, slash, movetoworkspacesilent, 5
      bind = $mainMod SUPER_CTRL, asterisk, movetoworkspacesilent, 6


      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
