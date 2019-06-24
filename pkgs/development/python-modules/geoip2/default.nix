{ stdenv, fetchPypi, buildPythonPackage, mock, maxminddb, requests }:

buildPythonPackage rec {
  pname = "geoip2";
  version = "2.9.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1w7cay5q6zawjzivqbwz5cqx1qbdjw6kbriccb7l46p7b39fkzzp";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ maxminddb requests ];

  meta = with stdenv.lib; {
    description = "This package provides an API for the GeoIP2 web services and databases. ";
    homepage = https://pypi.org/project/geoip2/;
    license = licenses.asl20;
  };
}

