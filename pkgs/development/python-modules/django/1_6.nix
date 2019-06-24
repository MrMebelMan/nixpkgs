{ stdenv
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "Django";
  version = "1.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "165bd5wmv2an9h365d12k0112z0l375dxsy7dlxa7r8kyg4gvnfk";
  };

  # too complicated to setup
  doCheck = false;

  # patch only $out/bin to avoid problems with starter templates (see #3134)
  postFixup = ''
    wrapPythonProgramsIn $out/bin "$out $pythonPath"
  '';

  meta = with stdenv.lib; {
    description = "A high-level Python Web framework";
    homepage = https://www.djangoproject.com/;
    license = licenses.bsd0;
  };
}
