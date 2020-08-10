{ stdenv, fetchPypi, buildPythonPackage, django }:

buildPythonPackage rec {
  pname = "django-countries";
  version = "6.1.2";

  src = fetchPypi {
    inherit version;
    pname = "django-countries";
    sha256 = "154m1baxdxs3dxc3j0ckij3sbw1djzj1zf5mcprz7dd0z5v9pbp2";
  };

  # too complicated to setup - needs a running django instance
  doCheck = false;

  propagatedBuildInputs = [ django ];

  meta = with stdenv.lib; {
    description = "A Django application that provides country choices for use with forms, flag icons static files, and a country field for models.";
    homepage = "https://github.com/SmileyChris/django-countries/";
    license = licenses.mit;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
