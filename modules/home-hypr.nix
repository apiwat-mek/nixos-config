{ config, pkgs, ... }:

let
  ditfilesDir = "/home/mek/nixos-dotfile/";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${ditfilesDir}/${path}";
in 

{
  xdg.configFile = { 
    "hypr".source = mkSymlink "config/hypr";
    "waybar".source = mkSymlink "config/waybar";
    "rofi".source = mkSymlink "config/rofi";
    "swaync".source = mkSymlink "config/swaync";
  };
}
