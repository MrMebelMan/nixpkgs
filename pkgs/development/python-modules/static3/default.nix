{ stdenv, fetchPypi, buildPythonPackage, mock }:

buildPythonPackage rec {
  pname = "static3";
  version = "0.7.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1j275ys1byh8w55nginyjflxr4rmgrzfy2xj5sphfmf79g342ik7";
  };

  doCheck = false;

  buildInputs = [ mock ];

  # propagatedBuildInputs = [ django ];

  meta = with stdenv.lib; {
    description = "A really simple WSGI way to serve static (or mixed) content.";
    homepage = https://github.com/rmohr/static3;
    license = licenses.gpl3;
    maintainers = with maintainers; [ mrmebelman ];
  };
}

