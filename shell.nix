{
  pkgs ?
    let
      flakeLock = builtins.fromJSON (builtins.readFile ./flake.lock);
      inherit (flakeLock.nodes.nixpkgs) locked;
    in
    import (builtins.fetchTree locked) { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    hugo
    nodejs
  ];
}
