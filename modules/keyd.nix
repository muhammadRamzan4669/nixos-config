# nix-config/modules/keyd.nix
{ config, lib, pkgs, ... }:

{ services.keyd = {
  enable = true;
  keyboards.default = {
    ids = [ "*" ];
    settings = {
  main = {
    a = "overload(meta, a)";      # Hold 'a' for Super/Win
    s = "overload(alt, s)";       # Hold 's' for Alt
    d = "overload(shift, d)";     # Hold 'd' for Shift
    f = "overload(control, f)";   # Hold 'f' for Control
    semicolon = "overload(meta, semicolon)"; # Hold ';' for Super/Win
    l = "overload(alt, l)";       # Hold 'l' for Alt
    k = "overload(shift, k)";     # Hold 'k' for Shift
    j = "overload(control, j)";   # Hold 'j' for Control
  };
};
  };
};
}
