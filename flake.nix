{
	description = "Hyprland on NixOS";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
	};
	
	outputs = { nixpkgs, home-manager, catppuccin, ... }@inputs: {
		nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
      specialArgs = {inherit inputs;};
			modules = [
				./host/qemu/configuration.nix
        catppuccin.nixosModules.catppuccin
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.mek = { 
              imports = [ 
              ./modules/home.nix 
              ./modules/home-hypr.nix
              catppuccin.homeModules.catppuccin 
            ];
          };
						backupFileExtension = "backup";
					};
				}
			];
		};
	};
}
