{ stdenv, fetchPypi, buildPythonPackage, mock }: #, maxminddb }:

buildPythonPackage rec {
  pname = "maxminddb";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "04mpilsj76m29id5xfi8mmasdmh27ldn7r0dmh2rj6a8v2y5256z";
  };

  doCheck = false;

  buildInputs = [ mock ];

  # propagatedBuildInputs = [ maxminddb ];

  meta = with stdenv.lib; {
    description = "A module for reading MaxMind DB files. The module includes both a pure Python reader and an optional C extension.";
    homepage = https://pypi.org/project/maxminddb/;
    license = licenses.asl20;
    maintainers = with maintainers; [ mrmebelman ];
  };
}

