{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      format = ''
        $username$hostname
      '';

      fill = {
        symbol = " ";
        disabled = false;
      };

      username = {
        format = "[$user]($style)";
        show_always = true;
      };

      hostname = {
        format = "[@$hostname]($style)";
        ssh_only = false;
        style = "bold green";
      };
    };
  };
}
