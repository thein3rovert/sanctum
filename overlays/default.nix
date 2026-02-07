{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: prev: (import ../pkgs { pkgs = final; });
  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    brave = prev.brave.override {
      commandLineArgs = "--password-store=gnome-libsecret";
    };

    # nodejs_24 = inputs.nixpkgs-stable.legacyPackages.${prev.system}.nodejs_24;
    # paperless-ngx = inputs.nixpkgs-45570c2.legacyPackages.${prev.system}.paperless-ngx;
    # anytype-heart = inputs.nixpkgs-9e58ed7.legacyPackages.${prev.system}.anytype-heart;
    # trezord = inputs.nixpkgs-2744d98.legacyPackages.${prev.system}.trezord;
    # mesa = inputs.nixpkgs-master.legacyPackages.${prev.system}.mesa;
    # hyprpanel = inputs.hyprpanel.packages.${prev.system}.default.overrideAttrs (prev: {
    #   version = "latest"; # or whatever version you want
    #   src = final.fetchFromGitHub {
    #     owner = "Jas-SinghFSU";
    #     repo = "HyprPanel";
    #     rev = "master"; # or a specific commit hash
    #     hash = "sha256-l623fIVhVCU/ylbBmohAtQNbK0YrWlEny0sC/vBJ+dU=";
    #   };
    # });
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
