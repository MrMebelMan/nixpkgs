{ lib, fetchurl, buildPythonPackage, midiutil }:

buildPythonPackage rec {
  pname = "renardo-lib";
  version = "0.9.8";

  
  # src = fetchFromGitHub {
  #   owner = "e-lie";
  #   repo = "renardo";
  #   rev = version; # commit or tag
  #   sha256 = "1hfhirbqp53323yq1l1gd9ks7b4zlap9ayzkzxjyc492kj1jg2r1"; # You need to calculate this
  # };

  src = fetchurl {
    url = "https://github.com/e-lie/renardo/archive/refs/tags/v0.9.8.tar.gz";
    sha256 = "03pfkavah2jpm0pjqrp291a20jcgbla25lbjam3axcvgbbnxj1l4";
  };

  sourceRoot = "renardo-0.9.8/renardo_lib"; # adjust this if the structure is different

  # TODO: 'renardo_gatherer==0.1.3',
  propagatedBuildInputs = [ midiutil ];

  # Include other necessary build steps, if there are any

  doCheck = false;

  meta = with lib; {
    description = "Libraries for Renardo livecoding environment";
    homepage = "https://github.com/e-lie/renardo";
    #license = licenses.mit; # or whatever license it uses
    maintainers = with maintainers; [ mrmebelman ];
  };
}


# { lib
# , stdenv
# , buildPythonPackage
# , fetchPypi
# , tkinter
# , supercollider
# , psutil
# , textual
# }:
# 
# buildPythonPackage rec {
#   pname = "renardo-lib";
#   version = "0.9.8";
# 
#   src = fetchPypi {
#     pname = "renardo-lib";
#     inherit version;
#     sha256 = "1hfhirbqp53323yq1l1gd9ks7b4zlap9ayzkzxjyc492kj1jg2rv";
#     
#   };
# 
#   #propagatedBuildInputs = [ tkinter psutil textual ]
#   propagatedBuildInputs = [ tkinter psutil textual  ]
#     # we currently build SuperCollider only on Linux
#     # but FoxDot is totally usable on macOS with the official SuperCollider binary
#     ++ lib.optionals stdenv.isLinux [ supercollider ];
# 
#   # Requires a running SuperCollider instance
#   doCheck = false;
# 
#   meta = with lib; {
#     description = "A community-maintained FoxDot fork with a lot of bonus features. Live coding music with SuperCollider";
#     mainProgram = "renardo";
#     homepage = "https://renardo.org/";
#     license = licenses.cc-by-sa-40;
#     maintainers = with maintainers; [ mrmebelman ];
#   };
# }
