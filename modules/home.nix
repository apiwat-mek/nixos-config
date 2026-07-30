{ config, pkgs, inputs, ... }:

let
  ditfilesDir = "/home/mek/nixos-dotfile/";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${ditfilesDir}/${path}";
in 

{

  imports = [
    ./theme.nix
  ];

	home.username = "mek";
	home.homeDirectory = "/home/mek";
	home.stateVersion = "26.05";
  xdg.configFile."nvim".source = mkSymlink "config/nvim";
}
