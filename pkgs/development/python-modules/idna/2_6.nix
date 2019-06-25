{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "idna";
  version = "2.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "13qaab6d0s15gknz8v3zbcfmbj6v86hn9pjxgkdf62ch13imssic";
  };

  meta = {
    homepage = "https://github.com/kjd/idna/";
    description = "Internationalized Domain Names in Applications (IDNA)";
    license = lib.licenses.bsd3;
  };
}
