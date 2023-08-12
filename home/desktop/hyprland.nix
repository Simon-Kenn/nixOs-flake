{
  host,
  inputs,
  config,
  ...
}: let
  inherit (config.colorscheme) colors;
in {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      monitor=${host.monitors.main}, 1920x1080@60, 0x0, 1
      monitor=${host.monitors.second}, 1920x1080@60, 1920x0, 1
       input {
        kb_layout=fr
        kb_variant=bepo
        kb_model=
        kb_options=
        kb_rules=

        follow_mouse=1

        touchpad {
            natural_scroll = no
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }

      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = 0xFF${colors.base0C}
        col.inactive_border =  0xFF${colors.base02}
        col.group_border_active = 0xFF${colors.base0B}
        col.group_border = 0xFF${colors.base04}

        layout = dwindle
      }

      decoration {
        rounding = 5
        multisample_edges = 1

        active_opacity = 0.94
        inactive_opacity = 0.84
        fullscreen_opacity = 1.0

        blur {
          enabled = 5
          passes = 3
          new_optimizations = true
        }

        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
      }

      animations {
        enabled = yes

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        bezier = overshot, 0.13, 0.99, 0.29, 1.1

        animation = windows, 1, 5, default
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 8, default
        animation = workspaces, 1, 3, overshot, slide
      }

      dwindle {
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
      }

      master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
      }

      device:epic mouse V1 {
          sensitivity = -0.5
      }

      # APP #
      #-----#

      exec-once = waybar & logseq & kitty & firefox & mako
      exec=swaybg -m fill -i ~/.local/share/wallpapers/abstract_ghost.jpg

      # Source a file (multi-file configs)

      # WIMDOWS RULES #
      # ------------- #

      workspace = 1, monitor:${host.monitors.main}, default:true
      workspace = 2, monitor:${host.monitors.main}, default:true
      workspace = 3, monitor:${host.monitors.main}, default:true
      workspace = 4, monitor:${host.monitors.second}, default:true
      workspace = 5, monitor:${host.monitors.second}, default:true
      workspace = 6, monitor:${host.monitors.second}, default:true

      # Floating
      # --------

      windowrulev2 = float, class:Wofi
      windowrulev2 = float, class:Rofi
      windowrulev2 = float, class:notification
      windowrulev2 = float, class:download
      windowrulev2 = float, class:dialog
      windowrulev2 = float, class:error


      windowrulev2 = workspace 1, class:^(Kitty)$
      windowrulev2 = workspace 3, class:^(Logseq)$

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      # -- Kitty --
      windowrule=opacity 0.8,kitty
      windowrule=float,kitty_float
      windowrule=size 70% 70%,kitty_float
      windowrule=center,kitty_float

      # BINDINGS
      # --------
      $mainMod = SUPER

      # Exec
      bind = $mainMod, RETURN, exec, kitty
      bind = $mainMod, SPACE, exec, wofi --show drun
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
