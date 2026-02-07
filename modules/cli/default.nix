{pkgs, ...}: {
  imports = [
    ./fzf.nix
    ./nitch.nix
    ./nushell.nix
  ];

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };

  programs.bat = {enable = true;};

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable =
      true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
  };

  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      drawbox = true;
      hidden = true;
      icons = true;
      theme = "Dracula";
      previewer = "bat";
    };
  };

  home.packages = with pkgs; [
    agenix-cli
    alejandra
    btop
    comma
    coreutils
    devenv
    fd
    httpie
    jq
    just
    lazygit
    nix-index
    progress
    ripgrep
    tldr
    trash-cli
    unzip
    zip
  ];
}
