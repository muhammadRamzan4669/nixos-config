{
  description = "My First Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim-starter = {
      url = "github:LazyVim/starter";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
	  let
	    lib = nixpkgs.lib;
	  in {
	    nixosConfigurations = {
	      nixos = lib.nixosSystem {
	        system = "x86_64-linux";
		      modules = [
            ./configuration.nix
            ./modules/iwd.nix
	          home-manager.nixosModules.home-manager {
              home-manager.users.lynx = import ./home.nix;
		          home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { inputs = self.inputs; };
		        }
          ];
	      };
      };
  };
}
