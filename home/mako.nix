{...}: {
  services.mako = {
    enable = true;

    anchor = "top-right";
    font = "Liga SFMono Nerd Font 12";
    backgroundColor = "#24273A";
    text-color = "#CAD3F5";
    width = 400;
    height = 100;
    margin = 20;
    padding = "7, 12, 10";
    borderSize = 1;
    borderRadius = 3;
    progressColor = "over #5588AAFF";
    icons = true;
    maxIconSize = 32;
    markup = true;
    actions = true;
    format = "<b>%s</b>\n%b";
    defaultTimeout = 5000;
    ignoreTimeout = false;
  };
}
