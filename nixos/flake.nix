{
  description = "reeth's NixOs Dotfiles";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
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
        #./modules/auto-upgrade.nix
      ];
    };
  };
}