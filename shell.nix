let pkgs = import ./nixpkgs.nix {}; in

pkgs.mkShell {
  packages = [
    pkgs.rustc
    pkgs.cargo
    pkgs.openssl
    pkgs.pkg-config
    pkgs.imagemagick
    pkgs.libclang
  ];

  LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";

  BINDGEN_EXTRA_CLANG_ARGS = 
    # Includes with normal include path
    (builtins.map (a: ''-I"${a}/include"'') [
      # add dev libraries here (e.g. pkgs.libvmi.dev)
      pkgs.glibc.dev
    ])
    # Includes with special directory paths
    ++ [
      ''-I"${pkgs.libclang.lib}/lib/clang/${pkgs.libclang.version}/include"''
      ''-I"${pkgs.glib.dev}/include/glib-2.0"''
      ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
    ];

}
