{ stdenv, lib, buildPythonPackage, isPyPy, fetchPypi, postgresql, openssl }:

buildPythonPackage rec {
  pname = "psycopg2";
  version = "2.7.3.2";

  disabled = isPyPy;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0alvmngx156kp1fgzi82j9wxk419mxz4iqlgvzwnh13xanz16cjw";
  };

  buildInputs = lib.optional stdenv.isDarwin openssl;
  nativeBuildInputs = [ postgresql ];

  doCheck = false;

  meta = with lib; {
    description = "PostgreSQL database adapter for the Python programming language";
    license = with licenses; [ gpl2 zpl20 ];
  };
}
