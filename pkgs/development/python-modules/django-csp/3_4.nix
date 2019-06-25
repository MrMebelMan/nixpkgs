{ stdenv, fetchPypi, buildPythonPackage, django_2_0_2 }:

buildPythonPackage rec {
  pname = "django_csp";
  version = "3.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "027428294ykb5yzyhy9dsbigv5n9glsc6mccyim8z7ikw7acrh04";
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
