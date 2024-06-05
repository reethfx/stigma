{ config, pkgs, ... }: {
  xdg.configFile."/home/reeth/.config/BetterDiscord/themes/".source = ./themes;
}
