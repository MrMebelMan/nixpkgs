{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "dj-database-url";
  version = "0.4.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "024zbkc5rli4hia9lz9g8kf1zxhb2gwawj5abf67i7gf8n22v0x6";
  };

  # Tests access a DB via network
  doCheck = false;

  meta = with lib; {
    description = "Use Database URLs in your Django Application";
    homepage = https://github.com/kennethreitz/dj-database-url;
    license = licenses.bsd2;
  };
}
