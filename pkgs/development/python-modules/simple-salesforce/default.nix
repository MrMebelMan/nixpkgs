{ stdenv, fetchPypi, buildPythonPackage, mock, requests }:

buildPythonPackage rec {
  pname = "simple-salesforce";
  version = "0.74.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1p4z74pdprb3z8a314ba4rhcjxlnrb0grnxzpvjp2lah8z7k9f30";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ requests ];

  meta = with stdenv.lib; {
    description = "A basic Salesforce.com REST API client";
    homepage = https://github.com/simple-salesforce/simple-salesforce;
    license = licenses.asl20;
  };
}

