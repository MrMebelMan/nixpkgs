{ stdenv, fetchurl, buildPythonPackage, mock, django_2_0_2, pynacl_1_0_1 }:

buildPythonPackage rec {
  pname = "django-csp-nonce";
  version = "1.0b20";

  src = fetchurl {
    url = "https://github.com/Bennyoak/django-csp-nonce/archive/1.0b20.tar.gz";
    sha256 = "179202wbrl0058gazv2mxkci7sir3w5hhiigb8lqfb0l42rxp73s";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ django_2_0_2 pynacl_1_0_1 ];

  meta = with stdenv.lib; {
    description = "DCN is a Content-Security-Policy nonce injection support system for Django and CSP.";
    homepage = https://github.com/Bennyoak/django-csp-nonce;
    license = licenses.mpl20;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
