# modules/zsh.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-powerlevel10k
  ];
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  home.file.".p10k.zsh".source = ../p10k.zsh;
}
