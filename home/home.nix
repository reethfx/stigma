{ config, pkgs, lib, inputs, spicetify-nix, ... }: 

{
     home = { 
      username = "reeth";
      homeDirectory = "/home/reeth";
      stateVersion = "24.11"; #FIXME change this to the latest version
      file = {};
      sessionVariables = {};
      };
      programs.home-manager.enable = true;

      # Imports
      imports = [
      ];
}
