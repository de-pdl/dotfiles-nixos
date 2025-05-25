{
 	description = "The beginning to the end";

 	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	};

	outputs = { self, nixpkgs, ... } @ inputs: 
	let
		system = "x86_64-linux";
		
		pkgs = import nixpkgs {
			inherit system;
			
			config = {
				allowUnfree = true;
			};
		};
	in
	{
		nixosConfigurations = {
			myNixos = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit system; };
				modules = [
					./etc/nixos/configuration.nix
					./etc/nixos/hardware-configuration.nix
				];
			};
		};
	};

}
