{ stdenv, fetchPypi, buildPythonPackage,
  mock, django }:
buildPythonPackage rec {
  pname = "django-maintenance-mode";
  version = "0.13.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "16yfw85r6my14vbrf9g2hj5p7ivgjvrd16s9prsjzqj9k8qikch2";
  };

  doCheck = false;

  buildInputs = [ mock ];

  propagatedBuildInputs = [ django ];

  meta = with stdenv.lib; {
    description = "Shows a 503 error page when maintenance-mode is on";
    homepage = https://github.com/fabiocaccamo/django-maintenance-mode;
    license = licenses.bsd3;
    maintainers = with maintainers; [ mrmebelman ];
  };
}



