{
 	description = "The beginning to the end";

 	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	};

	outputs = { self, nixpkgs, ... } @ inputs: 
	let
		root-save = /etc/nixos;
	in
	{
		nixosConfigurations.nixos  = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				.root-save/configuration.nix
				.root-save/hardware-configuration.nix
			];
		};
	};

}
