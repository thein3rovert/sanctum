{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  goCfg = config.features.coding.go;
  nixCfg = config.features.coding.nix;
  pythonCfg = config.features.coding.python;
in
{
  options.features.coding = {
    go = {
      enable = mkEnableOption "enable Go development environment";
      packageSet = mkOption {
        type = types.str;
        default = "default";
        description = "Which nixpkgs variant to use for Golang";
      };
      additionalPackages = mkOption {
        type = types.listOf types.str;
        example = [
          delve
          go-outline
        ];
      };

    };
    python = {
      enable = mkEnableOption "enable Python development environment";
      additionalPackages = mkOption {
        type = types.listOf types.str;
        example = [
          "requests"
          "pandas"
        ];
      };
    };
    nix = {
      enable = mkEnableOption "enable Nix development environment";
    };
  };

  config =
    let
      selectPkgs = packageSet: if packageSet == "default" then pkgs else pkgs.${packageSet};
    in
    mkMerge [
      (mkIf goCfg.enable (
        let
          goPkgs = selectPkgs goCfg.packageSet;
        in
        {
          home.packages =
            with goPkgs;
            [
              go
              gopls
            ]
            ++ (map (name: goPkgs.${name}) goCfg.additionalPackages);
        }
      ))
      (mkIf pythonCfg.enable {
        home.packages = with pkgs; [
          (python3.withPackages (
            ps:
            with ps;
            [
              uv
              pip
              pipx
              virtualenv
            ]
            ++ (map (name: ps.${name}) pythonCfg.additionalPackages)
          ))
          pyrefly
          black
        ];
      })
      (mkIf nixCfg.enable {
        home.packages = with pkgs; [
          alejandra
          nil
          nixd
          statix
          deadnix
          nix-tree
        ];
      })
    ];
}
