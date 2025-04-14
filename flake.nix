{
  inputs = {
    # Pin to hugo v0.145.0, see https://github.com/jpanther/congo/issues/1049
    nixpkgs.url = "github:nixos/nixpkgs?ref=b9d43b3fe5152d1dc5783a2ba865b2a03388b741";
  };

  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.callPackage ./shell.nix { };
      });
    };
}
