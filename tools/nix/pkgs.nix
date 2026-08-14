arg:
let
  repo = "https://github.com/NixOS/nixpkgs";
  rev = "044bfe75bfe4c7bbe043dc17b5e42ea823b84a09";
  nixpkgs = import (builtins.fetchTarball {
    url = "${repo}/archive/${rev}.tar.gz";
    sha256 = "1sns414dii8jmydcvps6sw5xlwnlzfx61h9ggvnl0kclf9v4q4kw";
  }) arg;
in
# Unstable channel no longer supports Intel architecture for macOS. We can use the 26.05 channel
# to keep testing on that platform for a little longer.
# TODO: remove this when 26.05 is EOL (end of 2026)
if builtins.currentSystem == "x86_64-darwin" then (import ./pkgs-26.05.nix arg) else nixpkgs
