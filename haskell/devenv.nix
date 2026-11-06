{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  packages = [ ];

  languages.haskell = {
    enable = true;
    package = pkgs.haskellPackages.ghcWithPackages (hp: [
      hp.split
    ]);
  };

  enterShell = ''
    ghc --version
  '';
}
