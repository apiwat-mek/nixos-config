{
  programs.git = {
    enable = true;

    userName = "mek";
    userEmail = "apiwat.mage@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
