{config, ...}: let
  dotfilesDir = "/home/mek/nixos-dotfile/";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
in {
  xdg.configFile = {
    "hypr".source = mkSymlink "config/hypr";
    "waybar".source = mkSymlink "config/waybar";
    "rofi".source = mkSymlink "config/rofi";
    "swaync".source = mkSymlink "config/swaync";
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
