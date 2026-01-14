{
  description = "Dev shell for a PNPM Node.js project";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux"; # adjust for your system
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.default = pkgs.mkShell {
      buildInputs = [
        pkgs.nodejs  # Node.js
        pkgs.pnpm    # pnpm CLI
        pkgs.git     # git, optional but handy
      ];

      shellHook = ''
        echo "Welcome to your pnpm dev shell!"
        echo "Node version: $(node -v)"
        echo "PNPM version: $(pnpm -v)"
      '';
    };
  };
}
