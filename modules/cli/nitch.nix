{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.cli.shell.nitch;
in {
  options.features.cli.shell.nitch.enable = mkEnableOption "enable nitch";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [nitch];
  };
}
