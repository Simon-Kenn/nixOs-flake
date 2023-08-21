{host, ...}: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "${host.monitors.left}, 1920x1080@60, 0x0, 1"
      "${host.monitors.center}, 1920x1080@60, 1920x0, 1"
    ];

    workspace = [
      "1, monitor:${host.monitors.left}, default:true"
      "2, monitor:${host.monitors.left}, default:true"
      "3, monitor:${host.monitors.left}, default:true"
      "4, monitor:${host.monitors.left}, default:true"
      "5, monitor:${host.monitors.left}, default:true"
      "6, monitor:${host.monitors.center}, default:true"
      "7, monitor:${host.monitors.center}, default:true"
      "8, monitor:${host.monitors.center}, default:true"
      "9, monitor:${host.monitors.center}, default:true"
      "10, monitor:${host.monitors.center}, default:true"
    ];

    windowrulev2 = [
      "float, class:Wofi"
      "float, class:notification"
      "float, class:download"
      "float, class:dialog"
      "float, class:error"

      "workspace 1, class:(Kitty),title:(kitty)"
      "workspace 2, class:(Firefox),title:(firefox)"
      "workspace 8, class:(Kitty),title:(kitty)"
      "workspace 9, class:(Logseq),title:(logseq)"
      "workspace 10, class:(Discord),title:(discord)"
    ];
  };
}
