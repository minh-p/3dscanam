{
  description = "C++ W/ OpenCV, SDL3, GTest";
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-26.06"; };
  outputs = { self, ... }@inputs:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (system:
          f {
            inherit system;
            pkgs = import inputs.nixpkgs { inherit system; };
          });

    in {
      devShells = forEachSupportedSystem ({ pkgs, system }: {
        default = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
          packages = with pkgs;
            [ clang-tools cmake gtest self.formatter.${system} ]
            ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [ gdb ];
        };
      });
      formatter = forEachSupportedSystem ({ pkgs, ... }: pkgs.nixfmt);
    };
}
