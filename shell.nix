let pkgs = import <nixpkgs> {}; in

pkgs.mkShell {
  packages = [
    pkgs.rustc
    pkgs.cargo

    pkgs.pkg-config
    pkgs.openimageio

    pkgs.libcaca
  ];
}
