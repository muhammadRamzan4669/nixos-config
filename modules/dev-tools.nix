{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_23
    yarn
    nodePackages.typescript-language-server
    lua-language-server
  ];
}
