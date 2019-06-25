{ stdenv, fetchurl, buildPythonPackage, mock, django_2_0_2, django-ranged-response, pillow }:

buildPythonPackage rec {
  pname = "django-simple-captcha";
  version = "0.5.11";

  src = fetchurl {
    url = "https://github.com/mbi/django-simple-captcha/archive/v0.5.11.tar.gz";
    sha256 = "0nzfvanz7casav507x4rzkrq12grkq4xrh12w25mykp1917nm8kw";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ django_2_0_2 django-ranged-response pillow ];

  meta = with stdenv.lib; {
    description = "An extremely simple, yet highly customizable Django application to add captcha images to any Django form";
    homepage = https://github.com/mbi/django-simple-captcha;
    license = licenses.mit;
  };
}



