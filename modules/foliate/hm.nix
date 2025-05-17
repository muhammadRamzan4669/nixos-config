{ pkgs, ... }: {
  home.packages = with pkgs; [ foliate ];
  # Example: Configure Foliate settings via xdg.configFile
  xdg.configFile."foliate/settings.json".text = ''
    {
      "theme": "dark",
      "font": "JetBrains Mono"
    }
  '';
}
