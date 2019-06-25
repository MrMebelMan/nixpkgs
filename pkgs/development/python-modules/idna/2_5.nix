{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "idna";
  version = "2.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1ara12a7k2zc69msa0arrvw00gn61a6i6by01xb3lkkc0h4cxd9w";
  };

  meta = {
    homepage = "https://github.com/kjd/idna/";
    description = "Internationalized Domain Names in Applications (IDNA)";
    license = lib.licenses.bsd3;
  };
}
