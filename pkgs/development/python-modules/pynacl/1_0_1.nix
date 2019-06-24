{ stdenv
, buildPythonPackage
, fetchPypi
, pytest
, libsodium
, cffi
, six
, hypothesis
}:

buildPythonPackage rec {
  pname = "pynacl";
  version = "1.0.1";

  src = fetchPypi {
    inherit version;
    pname = "PyNaCl";
    sha256 = "1x3k6xnpzrsm2a4048py6j9ikzj0dhbx3yxdvnwvjpx8b1rpl7fj";
  };

  checkInputs = [ pytest hypothesis ];
  buildInputs = [ libsodium ];
  propagatedBuildInputs = [ cffi six ];

  SODIUM_INSTALL = "system";

  # fixed in next release 1.3.0+
  # https://github.com/pyca/pynacl/pull/480
  # postPatch = ''
  #   substituteInPlace tests/test_bindings.py \
  #     --replace "average_size=128," ""
  # '';

  checkPhase = ''
    py.test
  '';

  meta = with stdenv.lib; {
    maintainers = with maintainers; [ va1entin memebelman ];
    description = "Python binding to the Networking and Cryptography (NaCl) library";
    homepage = https://github.com/pyca/pynacl/;
    license = licenses.asl20;
  };
}
