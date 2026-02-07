{
  config,
  lib,
  systemConfig ? {},
  ...
}: {
  imports = [
    ../../modules
  ];
  config = lib.mkMerge [
    {
      home = {
        username = "m3tam3re";
        homeDirectory = lib.mkDefault "/home/${config.home.username}";
        stateVersion = "25.05";
      };
      programs = {
        home-manager.enable = true;

        git = {
          enable = true;
          difftastic.enable = true;
          userName = "m3tam3re";
          userEmail = "m@m3tam3re.com";
          aliases = {
            st = "status";
            logd = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          };
          extraConfig = {
            core.excludesfile = "~/.gitignore_global";
            init.defaultBranch = "master";
          };
        };

        jujutsu = {
          enable = true;
          settings = {
            user = {
              email = "m@m3tam3re.com";
              name = "Sascha Koenig";
            };
          };
        };
      };
    }
    (lib.mkIf (systemConfig != {}) systemConfig)
  ];
}
