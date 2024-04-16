{ lib
, stdenv
, buildPythonPackage
, fetchurl
, requests
, beautifulsoup4
, indexed
}:

buildPythonPackage rec {
  pname = "renardo-gatherer";
  version = "0.1.3";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/4d/04/453d386418b4ee07e5bf84c42f390de7fc9a47e3a9b0c40b5186deb33944/renardo_gatherer-0.1.3.tar.gz";
    sha256 = "1hkk1dza227016hvxcfb3icm8693p4qvfxd8pkrzwd5zwfq4lm1c";
  };

  propagatedBuildInputs = [ requests beautifulsoup4 indexed ];

  doCheck = false;

  meta = with lib; {
    description = "Asset collector for Renardo Python livecoding environment";
    homepage = "https://pypi.org/project/renardo-gatherer/";
    license = licenses.cc-by-sa-40;
    maintainers = with maintainers; [ mrmebelman ];
  };
}

