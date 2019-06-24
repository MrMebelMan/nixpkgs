{ stdenv, fetchPypi, buildPythonPackage, mock, django }:

buildPythonPackage rec {
  pname = "django_csp";
  version = "3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ks4zszbjx5lyqlc34pjica8hfcjzw4i5m6pivvnyv8yf0vh4q04";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ django ];

  meta = with stdenv.lib; {
    description = "Adds Content-Security-Policy headers to Django";
    homepage = https://github.com/mozilla/django-csp;
    license = licenses.bsd3;
  };
}
