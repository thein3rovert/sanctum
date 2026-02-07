{ pkgs, ... }:
{
  features = {
    cli = {
      shell.nushell.enable = true;
      shell.nitch.enable = true;
      tools.fzf.enable = true;
    };
    coding = {
      nix = {
        enable = true;
      };
      go = {
        enable = true;
        packageSet = "stable";
        additionalPackages = [
          "gotools"
          "gotests"
          "go-outline"
        ];
      };
      python = {
        enable = true;
        additionalPackages = [
          "requests"
          "pandas"
        ];
      };
    };
  };
}
