{ stdenv, fetchurl, fetchPypi, buildPythonPackage, pynacl_1_0_1, django_2_0_2 }:

buildPythonPackage rec {
  pname = "django-csp-nonce";
  version = "1.0.0";

  src = fetchurl {
    url = "https://github.com/MrMebelMan/django-csp-nonce/archive/1.0.0.tar.gz";
    sha256 = "18izzrq4nh1x8dfm2h31q28w3livggwgg59ssn02fgxck6502xra";
  };

  doCheck = false;

  propagatedBuildInputs = [ pynacl_1_0_1 django_2_0_2 ];

  meta = with stdenv.lib; {
    description = "A Content-Security-Policy nonce injection support system for Django and CSP";
    homepage = https://github.com/Bennyoak/django-csp-nonce;
    license = licenses.mpl20;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
