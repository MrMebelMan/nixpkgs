{ stdenv, fetchPypi, buildPythonPackage, django_2_0_2 }:

buildPythonPackage rec {
  pname = "django-logentry-admin";
  version = "1.0.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1xpqfr02n365vvriamz5a0a90ax2cnvfa1nkl6ai2gawdcaglcq0";
  };

  doCheck = false;

  propagatedBuildInputs = [ django_2_0_2 ];

  meta = with stdenv.lib; {
    description = "Show all LogEntry objects in the Django admin site";
    homepage = https://github.com/yprez/django-logentry-admin;
    license = licenses.isc;
    maintainers = with maintainers; [ mrmebelman ];
  };
}

