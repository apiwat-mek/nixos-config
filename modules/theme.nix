{config, pkgs, ...}:

{
  catppuccin = {
    enable = true;
    accent = "pink";
    flavor = "mocha";
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-pink-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        variant = "mocha";
      };
    };
    font = {
      name = "Iosevka Nerd Font Propo Medium";
      size = 11;
    };
    colorScheme = "dark";
  };
    xdg.configFile = {
      "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
      "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
      "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 22;
  };
}
