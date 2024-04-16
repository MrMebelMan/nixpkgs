
{ lib
, stdenv
, buildPythonPackage
, fetchPypi
# , tkinter
# , supercollider
# , psutil
# , textual
}:

buildPythonPackage rec {
  pname = "indexed";
  version = "1.3.0";

  src = fetchPypi {
    pname = "indexed";
    inherit version;
    sha256 = "1na3h9vxhdplqg21akvqbfh51cnl099irgw3k5pyybnvckqx23ba";
    
  };


  # #propagatedBuildInputs = [ tkinter psutil textual ]
  # propagatedBuildInputs = [ tkinter psutil textual  ]
  #   # we currently build SuperCollider only on Linux
  #   # but FoxDot is totally usable on macOS with the official SuperCollider binary
  #   ++ lib.optionals stdenv.isLinux [ supercollider ];

  # ModuleNotFoundError: No module named '_overlapped'
  doCheck = false;

  meta = with lib; {
    description = "A dictionary that is indexed by insertion order.";
    homepage = "https://github.com/niklasf/indexed.py";
    license = licenses.psfl;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
