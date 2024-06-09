{
  description = "reeth's NixOs Dotfiles";

  inputs = {
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

  outputs = { nixpkgs, ... } @ inputs:
  {
    #FIXME: Change the hostname to your own
    nixosConfigurations.b3rsrk = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./modules/bluetooth.nix
        ./modules/fonts.nix
        ./modules/terminal.nix
        ./modules/locale.nix
        #./modules/auto-upgrade.nix
      ];
    };
  };
}