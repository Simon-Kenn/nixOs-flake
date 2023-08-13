{pkgs, ...}:{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.frappeDark;
    name = "Catppuccin-Frappe-Dark-Cursors";
  };
}
