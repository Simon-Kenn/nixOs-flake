{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings =  {
      format = 
        let
          git = "$git_branch$git_commit$git_state$git_status";
        in
        ''
          $username$hostname($cmd_duration)
          $directory(${git})
          ($shlvl)$jobs$character
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
        format = "[@$hostname]($style) ";
        ssh_only = false;
        style = "bold green";
      };

      cmd_duration = {
        format = "in [$duration]($style) ";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
      };

      shlvl = {
        format = " [$shlvl]($style) ";
        style = "bold cyan";
        threshold = 3;
        repeat = true;
        disabled = false;
      };

      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
        vimcmd_symbol = "[V](bold green) ";
      };
    };
  };
}
