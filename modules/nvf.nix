{ pkgs, ... }: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = false;
        lsp.enable = true;
        theme = {
                enable=true;
                name="gruvbox";
                style="dark";
        }
      };
    };
  };
}
