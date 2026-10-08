{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  packages = [ ];

  languages.haskell.enable = true;

  enterShell = ''
    ghc --version
  '';
}
