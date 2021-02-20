{ mkDerivation, base, bifunctors, containers, hpack, mtl, relude
, split, stdenv, text, transformers, unordered-containers
}:
mkDerivation {
  pname = "AOC2020";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    base bifunctors containers mtl relude split text transformers
    unordered-containers
  ];
  prePatch = "hpack";
  license = stdenv.lib.licenses.bsd3;
}
