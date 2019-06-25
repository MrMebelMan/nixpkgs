{ stdenv, fetchurl, buildPythonPackage,
  django-ranged-response, six, pillow }:

buildPythonPackage rec {
  pname = "django-simple-captcha";
  version = "0.5.6";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/4d/46/44aff307e370e873ebb44dd8e9a1bcde10ddd1e55779361a5654d273d939/django-simple-captcha-0.5.6.zip";
    sha256 = "02sbbsjlxa445hdfpxj4wmy1ynfj1vj0xblqhs7r05a2pbl3dzfn";
  };

  doCheck = false;

  propagatedBuildInputs = [ django-ranged-response six pillow ];

  meta = with stdenv.lib; {
    description = "An extremely simple, yet highly customizable Django application to add captcha images to any Django form";
    homepage = https://github.com/mbi/django-simple-captcha;
    license = licenses.mit;
    maintainers = with maintainers; [ mrmebelman ];
  };
}



