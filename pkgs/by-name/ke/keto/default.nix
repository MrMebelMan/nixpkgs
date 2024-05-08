{ fetchFromGitHub, buildGoModule, lib, stdenv }:

buildGoModule rec {
  pname = "keto";
  version = "0.13.0-alpha.0";

  src = fetchFromGitHub {
    owner = "ory";
    repo = "keto";
    rev = "v${version}";
    sha256 = "sha256-0yylaaXogN2HWXY8Tb7ScN4jdyeHecJ0gBYlVvcwaNE=";
  };

  vendorHash = "sha256-lgwV4Ysjmd9e850Rf5c0wSZtMW3U34/piwwG7dQEUV4=";

  tags = [ "sqlite" "json1" "hsm" ];

  subPackages = [ "." ];

  # Pass versioning information via ldflags
  ldflags = [
    "-s"
    "-w"
    "-X github.com/ory/keto/internal/driver/config.Version=${version}"
    "-X github.com/ory/keto/internal/driver/config.Commit=c75695837f170334b526359f28967aa33d61bce6"
  ];

  meta = with lib; {
    description = "ORY Keto, the open source access control server";
    homepage = "https://www.ory.sh/keto/";
    license = licenses.asl20;
    maintainers = with maintainers; [ mrmebelman ];
  };
}
