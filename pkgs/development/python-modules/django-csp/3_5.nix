{ stdenv, fetchPypi, buildPythonPackage, django_2_0_2 }:

buildPythonPackage rec {
  pname = "django_csp";
  version = "3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ks4zszbjx5lyqlc34pjica8hfcjzw4i5m6pivvnyv8yf0vh4q04";
  };

  doCheck = false;

  propagatedBuildInputs = [ django_2_0_2 ];

  meta = with stdenv.lib; {
    description = "Adds Content-Security-Policy headers to Django";
    homepage = https://github.com/mozilla/django-csp;
    license = licenses.bsd3;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
