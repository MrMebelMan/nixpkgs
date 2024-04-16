{ lib
, stdenv
, buildPythonPackage
, fetchPypi
, tkinter
, supercollider
, psutil
, textual
, renardo-lib
, foxdot-editor
}:

buildPythonPackage rec {
  pname = "renardo";
  version = "0.9.8";

  src = fetchPypi {
    pname = "renardo";
    inherit version;
    #sha256 = "528999da55ad630e540a39c0eaeacd19c58c36f49d65d24ea9704d0781e18c91";
    sha256 = "0nzhr1ppqmyvxvjqz7z91f8v5ax0alx94c9kkv5kfm8la0bbap39";
    
  };

  #propagatedBuildInputs = [ tkinter psutil textual ]
  propagatedBuildInputs = [ tkinter psutil textual renardo-lib foxdot-editor ]
    # we currently build SuperCollider only on Linux
    # but FoxDot is totally usable on macOS with the official SuperCollider binary
    ++ lib.optionals stdenv.isLinux [ supercollider ];

  # Requires a running SuperCollider instance
  doCheck = false;

  meta = with lib; {
    description = "A community-maintained FoxDot fork with a lot of bonus features. Live coding music with SuperCollider";
    mainProgram = "renardo";
    homepage = "https://renardo.org/";
    license = licenses.cc-by-sa-40;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
