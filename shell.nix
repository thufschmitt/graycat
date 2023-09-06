let pkgs = import ./nixpkgs.nix {}; in

pkgs.mkShell {
  packages = [
    pkgs.rustc
    pkgs.cargo
    pkgs.pkg-config
    pkgs.openimageio
  ];

}
