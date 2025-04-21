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
      flake = false; # Important: It's not a flake itself
    };
  };

  outputs = { self, nixpkgs, home-manager, lazyvim-starter, ... }@inputs:
	  let
	    lib = nixpkgs.lib;
	  in 
	  {
	    nixosConfigurations = {
	      nixos = lib.nixosSystem {
	        system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [
                  ./configuration.nix
                  
	 	  home-manager.nixosModules.home-manager
		  
                  ({config,pkgs,...}:{hardware.bluetooth.enable = true;
                  services.blueman.enable = true;		  
		  })
		  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.lynx = import ./home.nix {inherit pkgs inputs; };
		    home-manager.backupFileExtension = "backup";
                  }
                                  ];
	      };
          };
  };

}
