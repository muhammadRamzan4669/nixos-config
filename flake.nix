{

  description = "My First Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manger = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
	  let
	    lib = nixpkgs.lib;
	  in 
	  {
	    nixosConfigurations = {
	      nixos = lib.nixosSystem {
	        system = "x86_64-linux";
		modules = [
                  ./configuration.nix
                  home-manager.nixosModules.home-manager{
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manger.users.lynx = import ./home.nix;
                  }
                ];
	      };
          };
  };

}
