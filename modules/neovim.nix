# modules/neovim.nix
{ pkgs, inputs, ... }: 

let nvimConfig = pkgs.stdenv.mkDerivation {
    name = "nvim-config";
    src = inputs.lazyvim-starter;
    installPhase = ''
      mkdir -p $out
      cp -r . $out/
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
