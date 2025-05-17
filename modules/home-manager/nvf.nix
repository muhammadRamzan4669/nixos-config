{ pkgs, ... }: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        lsp.enable = true;
        
        theme = {
                enable=true;
                name="gruvbox";
                style="dark";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
                enableTreesitter = true;
                nix.enable = true;
                ts.enable = true;
        };
      };
    };
  };
}
