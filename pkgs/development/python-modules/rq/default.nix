{ stdenv, fetchPypi, buildPythonPackage, mock, click, redis }:

buildPythonPackage rec {
  pname = "rq";
  version = "1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0rx8xji473ggmcy40v7lh0a69j4nrb4qrp4kp1766qg0swp37pi2";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ click redis ];

  meta = with stdenv.lib; {
    description = "A simple, lightweight library for creating background jobs, and processing them";
    homepage = https://github.com/nvie/rq/;
    license = licenses.bsd2;
  };
}

