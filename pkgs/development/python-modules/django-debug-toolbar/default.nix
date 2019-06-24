{ stdenv, fetchPypi, buildPythonPackage,
  mock, django, sqlparse }:

buildPythonPackage rec {
  pname = "django-debug-toolbar";
  version = "2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0pgkf9d7pwh48xs1hmscnmlp6fsxdk9a3ygd5a86jzafpzb3ri8p";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ django sqlparse ];

  meta = with stdenv.lib; {
    description = "A configurable set of panels that display various debug information about the current request/response";
    homepage = https://github.com/jazzband/django-debug-toolbar;
    license = licenses.bsd3;
  };
}

