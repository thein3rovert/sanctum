{
  config,
  lib,
  systemConfig ? { },
  ...
}:
{
  imports = [
    ../../modules
  ];
  config = lib.mkMerge [
    {
      home = {
        username = "thein3rovert";
        homeDirectory = lib.mkDefault "/home/${config.home.username}";
        stateVersion = "25.05";
      };
      programs = {
        home-manager.enable = true;

        git = {
          enable = true;
          difftastic.enable = true;
          # userName = "thein3rovert";
          # userEmail = "danielolaibi@gmail.com";
          aliases = {
            st = "status";
            logd = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          };
          extraConfig = {
            core.excludesfile = "~/.gitignore_global";
            init.defaultBranch = "main";
          };
        };

        # jujutsu = {
        #   enable = true;
        #   settings = {
        #     user = {
        #       email = "thein3rovert@example.com";
        #       name = "thein3rovert";
        #     };
        #   };
        # };
      };
    }
    (lib.mkIf (systemConfig != { }) systemConfig)
  ];
}
