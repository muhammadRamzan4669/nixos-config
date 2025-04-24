# nix-config/modules/keyd.nix
{ config, lib, pkgs, ... }:

{ services.keyd = {
  enable = true;
  keyboards.default = {
    ids = [ "*" ];
    settings = {
      main = {
        a = "overload(leftmeta, a)";
        s = "overload(leftalt, s)";
        d = "overload(leftshift, d)";
        f = "overload(leftcontrol, f)";
        semicolon = "overload(rightmeta, semicolon)";
        l = "overload(rightalt, l)";
        k = "overload(rightshift, k)";
        j = "overload(rightcontrol, j)";
      };
    };
  };
};
}
