{config, ...}: let
  dotfilesDir = "/home/mek/nixos-dotfile/";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
in {
  imports = [
    ./theme.nix
    ./home-hypr.nix
    ./git.nix
  ];

  home.username = "mek";
  home.homeDirectory = "/home/mek";
  home.stateVersion = "26.05";
  xdg.configFile."nvim".source = mkSymlink "config/nvim";
}
