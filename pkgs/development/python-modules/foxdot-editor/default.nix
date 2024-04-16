{ lib, fetchurl, buildPythonPackage, psutil, playsound }:

buildPythonPackage rec {
  pname = "foxdot-editor";
  version = "0.9.8";

  src = fetchurl {
    url = "https://github.com/e-lie/renardo/archive/refs/tags/v0.9.8.tar.gz";
    sha256 = "03pfkavah2jpm0pjqrp291a20jcgbla25lbjam3axcvgbbnxj1l4";
  };

  sourceRoot = "renardo-0.9.8/FoxDotEditor"; # adjust this if the structure is different

  # TODO: 'renardo-lib==0.9.8'
  propagatedBuildInputs = [ psutil playsound ];

  # Include other necessary build steps, if there are any

  doCheck = false;

  meta = with lib; {
    description = "FoxDot editor for Renardo livecoding environment";
    homepage = "https://github.com/e-lie/renardo";
    #license = licenses.mit; # or whatever license it uses
    maintainers = with maintainers; [ mrmebelman ];
  };
}

