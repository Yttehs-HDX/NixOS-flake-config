{ ... }:

{
  user = {
    name = "testuser";
    description = "Test User";
    isSuper = false;
  };

  # This user does NOT have desktop configuration
  # Only basic home software

  home.software = {
    home-manager.enable = true;
    zsh.enable = true;
    
    git.enable = true;
    neovim.enable = true;
    
    bat.enable = true;
    eza.enable = true;
    fzf.enable = true;
  };
}
