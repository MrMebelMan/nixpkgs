{ stdenv, fetchPypi, buildPythonPackage, mock }:

buildPythonPackage rec {
  pname = "isoweek";
  version = "1.3.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1s7zsf0pab0l9gn6456qadnz5i5h90hafcjwnhx5mq23qjxggwvk";
  };

  doCheck = false;

  buildInputs = [ mock ];

  # propagatedBuildInputs = [ ];

  meta = with stdenv.lib; {
    description = "The module provide the class Week. Instances represent specific weeks spanning Monday to Sunday.";
    homepage = https://github.com/gisle/isoweek;
    license = licenses.bsd2;
    maintainers = with maintainers; [ mrmebelman ];
  };
}

