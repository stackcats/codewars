{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  packages = [ ];

  languages.python.enable = true;

  enterShell = ''
    python --version # Use packages
  '';
}
