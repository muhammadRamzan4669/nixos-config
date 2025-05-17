{ pkgs, ... }: {
  home.packages = with pkgs; [
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  home.file.".p10k.zsh".source = ../../config/p10k.zsh;
}
