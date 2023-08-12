{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Frappe";
    font = {
      name = "FiraCode Nerd Font Mono";
    };

    shellIntegration.enableFishIntegration = true;

    settings = {
      background_opacity = "0.95";
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
  };
}
