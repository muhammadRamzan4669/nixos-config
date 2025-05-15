{ pkgs, ... }: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
                enable=true;
                name="gruvbox";
                style="dark";
        };
        languages = {
                enableLSP = true;
                enableTreesitter = true;
        };
      };
    };
  };
}
