{
  description = "A Nix-flake-based C/C++ development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # stable Nixpkgs

  outputs =
    { self, ... }@inputs:

    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import inputs.nixpkgs {
              inherit system;
              config = {
                allowUnfree = true;
              };
            };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default =
            let
              deps = with pkgs; [
                pkg-config
                libGL.dev
                # X11 libraries required by GLFW (might be needed depending on system)
                libx11
                libxcb
                libxdmcp
                libxkbcommon.dev
                libxrender.dev
                libxfixes.dev
                xorgproto
                libx11.dev
                libxmu.dev
                libxrandr.dev
                libxinerama.dev
                libxcursor.dev
                libxi.dev
                libxext.dev
                libxt.dev
                libxxf86vm.dev
              ];
            in
            pkgs.mkShell.override
              {
                # Override stdenv in order to change compiler:
                # stdenv = pkgs.clangStdenv;
              }
              {
                LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath deps;
                CXX_INCLUDE_PATH = pkgs.lib.makeIncludePath deps;
                C_INCLUDE_PATH = pkgs.lib.makeIncludePath deps;
                buildInputs =
                  with pkgs;
                  deps
                  ++ [
                    premake5
                    cmake # or other build systems like meson, etc.
                  ];

                packages = with pkgs; [
                  gcc
                  cmake
                  openssl
                  protobuf
                ];
              };
        }
      );
    };
}
