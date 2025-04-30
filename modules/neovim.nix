{ pkgs, inputs, ... }:

let nvimConfig = pkgs.stdenv.mkDerivation {
    name = "nvim-config";
    src = inputs.lazyvim-starter;
    installPhase = ''
      mkdir -p $out
      cp -r . $out/
      # Remove Mason to use system language servers
      rm $out/lua/plugins/mason.lua || true
    '';
  };

in {
  home.packages = with pkgs; [ neovim ];
  home.file.".config/nvim" = {
    source = nvimConfig;
    recursive = true;
    onChange = ''
      chmod -R u+w $HOME/.config/nvim
    '';
  };
}
