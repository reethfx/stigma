{
  description = "Home Manager configuration of reeth";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = { 
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  {
    #FIXME change the variable name to your hostname, mine is b3rsrk
    nixosConfigurations = {
      b3rsrk = nixpkgs.lib.nixosSystem { 
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [ 
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.reeth =  import ./home.nix; 
            extraSpecialArgs = { inherit inputs; };
           };
          }
        ];
      };
    };
  };
}
