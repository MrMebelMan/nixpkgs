{ stdenv, fetchPypi, buildPythonPackage, django_2_0_2 }:

buildPythonPackage rec {
  pname = "django-maintenance-mode";
  version = "0.9.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "18wvjdzmz1p71fcmd4dg4d1b82jf0d1ppyml5fl2pqn23i75s14f";
  };

  doCheck = false;

  propagatedBuildInputs = [ django_2_0_2 ];

  meta = with stdenv.lib; {
    description = "Shows a 503 error page when maintenance-mode is on";
    homepage = https://github.com/fabiocaccamo/django-maintenance-mode;
    license = licenses.bsd3;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
