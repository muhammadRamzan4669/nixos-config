{

  description = "My First Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
                  
	 	  home-manager.nixosModules.home-manager
		  
		  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.lynx = import ./home.nix;
		    home-manager.backupFileExtension = "backup";
                  }
                ];
	      };
          };
  };

}
