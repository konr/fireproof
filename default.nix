{ mkDerivation, base, cmdargs, hspec, stdenv }:
mkDerivation {
  pname = "fireproof";
  version = "0.1.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base ];
  executableHaskellDepends = [ base cmdargs ];
  testHaskellDepends = [ base hspec ];
  homepage = "https://github.com/konr/fireproof#readme";
  license = stdenv.lib.licenses.bsd3;
}
